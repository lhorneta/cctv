<?php
 
// ����� ����� ������� ��� �������� ������������ ������ � ������� ������ ���� �����
 
// ���������� ������
 
$data = array();
 
if( isset( $_GET['uploadfiles'] ) ){
    $error = false;
    $files = array();
 
    $uploaddir = './uploads/'; // . - ������� ����� ��� ��������� submit.php
 
    // �������� ����� ���� � ���
 
    if( ! is_dir( $uploaddir ) ) mkdir( $uploaddir, 0777, true);
    chmod('uploads', 0777);
    // ���������� ����� �� ��������� ���������� � ���������
    $timestamp = time();
    foreach( $_FILES as $file ){
        if( move_uploaded_file( $file['tmp_name'], $uploaddir . $timestamp . '_' .  basename($file['name']) ) ){
            $files[] = realpath( $uploaddir . $file['name'] );
        }
        else{
            $error = true;
        }
    }
 
    $data = $error ? array('error' => '������ �������� ������.') : array('files' => $files );
 
    echo json_encode( $data );
}