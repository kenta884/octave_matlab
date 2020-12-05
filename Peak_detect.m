function [PPG,PWV,APG] = Peak_detect(Rph,h1,hd1,hdd1,l) %ECG_R_wave, pulse_wave, PWV_wave, APG_wave, Rph_length
  for i = 1:1:l-1;              %�v�f�̐������J��Ԃ�
  	[Vh1max, Ph1max] = max(h1(Rph(i):Rph(i+1)));   %臒l���オ��_���牺����_�Ԃ̍ő�l�ƍs�C���f�b�N�X
    Rpth1(i) = Ph1max+Rph(i)-1;
  end;
  PPG = Rpth1';

  for i = 1:1:l-1;
  	[Vhd1max, Phd1max] = max(hd1(Rph(i):Rph(i+1)));   %臒l���オ��_���牺����_�Ԃ̍ő�l�ƍs�C���f�b�N�X
    Rpthd1(i) = Phd1max+Rph(i)-1;
  end
  PWV = Rpthd1';

  for i = 1:1:l-1;
	  [Vhdd1max, Phdd1max] = max(hdd1(Rph(i):Rpth1(i)));   %臒l���オ��_���牺����_�Ԃ̍ő�l�ƍs�C���f�b�N�X
    Rpthdd1(i) = Phdd1max+Rph(i)-1;
  end
  APG = Rpthdd1';
endfunction