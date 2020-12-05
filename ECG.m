function tr = ECG(fecg,thr) %filterable ECG and threshold
%-------------------ECG----------
a = LH(fecg,thr);
b = HL(fecg,thr);

%-----臒l���オ��_�Ɖ�����_�̊֌W
if a(2) > b(2)
	a = b(1:end-1);
end

if a(1) > b(1)
	b = b(2:end);         %bb
end

%-----ECG R�s�[�N�̌��o
Rph = zeros(length(a),1);

for i = 1:1:length(a);                            %�v�f�̐������J��Ԃ�
	[Vhmax, Phmax] = max(fecg(a(i):b(i)));   %臒l���オ��_���牺����_�Ԃ̍ő�l�ƍs�C���f�b�N�X
	Rph(i) = a(i)+Phmax-1;                 %0�x�N�g����
end;

tr = Rph;                 %time index
endfunction


function a = LH(fecg,thr)
  a = find(fecg(1:end-1) <= std(fecg)*(thr) & fecg(2:end) > std(fecg)*(thr));		% 臒l���オ��_(�C���f�b�N�X)
endfunction

function b = HL(fecg,thr)
  b = find(fecg(1:end-1) > std(fecg)*(thr) & fecg(2:end) <= std(fecg)*(thr));		% 臒l��艺����(�C���f�b�N�X)
endfunction
