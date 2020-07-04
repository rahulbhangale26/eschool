<?php
class Uploader {
    private $destinationPath;
    private $errorMessage;
    private $extensions;
    private $maxSize;
    private $uploadName;
    public $name='Uploader';

    function setDir($path){
        $this->destinationPath  =   $path;
    }

    function setMaxSize($sizeMB){
        $this->maxSize  =   $sizeMB * (1024*1024);
    }

    function setExtensions($options){
        $this->extensions   =   $options;
    }

    function setMessage($message){
        $this->errorMessage =   $message;
    }

    function getMessage(){
        return $this->errorMessage;
    }

    function getUploadName(){
        return $this->uploadName;
    }

    function uploadFile($fileBrowse){
        $result =   false;
        $size   =   $_FILES[$fileBrowse]["size"];
        $name   =   $_FILES[$fileBrowse]["name"];
        $ext    =   pathinfo($name,PATHINFO_EXTENSION);

        $this->uploadName = time() . '-' . $name;

        if(empty($name))
        {
            $this->setMessage("File not selected ");
        }
        else if($size>$this->maxSize)
        {
            $this->setMessage("Too large file !");
        }
        else if(in_array($ext,$this->extensions))
        {
            if(!is_dir($this->destinationPath))
                mkdir($this->destinationPath);

            if(file_exists($this->destinationPath.'/'.$this->uploadName))
                $this->setMessage("File already exists. !");
            else if(!is_writable($this->destinationPath.'/'))
                $this->setMessage("Destination is not writable !");
            else
            {
                if(move_uploaded_file($_FILES[$fileBrowse]["tmp_name"],$this->destinationPath.'/'.$this->uploadName))
                {
                    $result =   true;
                }
                else
                {
                    $this->setMessage("Upload failed , try later !");
                }
            }
        }
        else
        {
            $this->setMessage("Invalid file format !");
        }
        return $result;
    }

    function deleteUploaded($fileBrowse){
        $name   =   $_FILES[$fileBrowse]["name"];
        $ext    =   pathinfo($name,PATHINFO_EXTENSION);
        unlink($this->destinationPath.'/'.$this->uploadName);
    }
}
?>