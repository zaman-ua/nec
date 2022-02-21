<?php

function dd($sVariable,$bDie=true,$bReturn=false){
    Debug::PrintPre($sVariable, $bDie, $bReturn);
}