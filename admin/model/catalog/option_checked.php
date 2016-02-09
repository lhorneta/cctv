<?php
class ModelCatalogOptionChecked extends Model {
  public function getDbColumns() {

                $colums = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "option_value`" );

                              $ret = array();

               foreach( $colums->rows as $field){
                 $ret[] = $field['Field'];
               }
          return $ret;
  }
   public function getInstall() {         
                          if( !array_search( 'checked', $this->getDbColumns() )) {

                                                                     $sql = '
                                                                     ALTER TABLE
                                                                                            `' . DB_PREFIX . 'option_value`
                                                                     ADD COLUMN
                                                                                            `checked` int(3) NOT NULL AFTER `image`';
                               $this->db->query( $sql );
                       }
    }
}
?>