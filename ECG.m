function tr = ECG(fecg,thr) %filterable ECG and threshold
%-------------------ECG----------
a = LH(fecg,thr);
b = HL(fecg,thr);

%-----閾値より上がる点と下がる点の関係
if a(2) > b(2)
	a = b(1:end-1);
end

if a(1) > b(1)
	b = b(2:end);         %bb
end

%-----ECG Rピークの検出
Rph = zeros(length(a),1);

for i = 1:1:length(a);                            %要素の数だけ繰り返す
	[Vhmax, Phmax] = max(fecg(a(i):b(i)));   %閾値より上がる点から下がる点間の最大値と行インデックス
	Rph(i) = a(i)+Phmax-1;                 %0ベクトルを
end;

tr = Rph;                 %time index
endfunction


function a = LH(fecg,thr)
  a = find(fecg(1:end-1) <= std(fecg)*(thr) & fecg(2:end) > std(fecg)*(thr));		% 閾値より上がる点(インデックス)
endfunction

function b = HL(fecg,thr)
  b = find(fecg(1:end-1) > std(fecg)*(thr) & fecg(2:end) <= std(fecg)*(thr));		% 閾値より下がる(インデックス)
endfunction
