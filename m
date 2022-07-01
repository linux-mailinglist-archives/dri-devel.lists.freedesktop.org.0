Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35025627B0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 02:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B9010E369;
	Fri,  1 Jul 2022 00:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378AD10E369
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 00:27:09 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220701002707epoutp04116cd6fddf667eac0b5f0585d1da96b0~9jPY-tcik1149311493epoutp04r
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 00:27:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220701002707epoutp04116cd6fddf667eac0b5f0585d1da96b0~9jPY-tcik1149311493epoutp04r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1656635227;
 bh=+Uyb+Sk9Z1bPH9TkanCr784yxeep/5h/CN3g6+QH9Ek=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=vNSqZrunEY9HMqIO8YinpsThIhnsb5J2WYapwt/ztW7i/Y707AsHUYZh1WXBRyUsU
 CQ6Z6LBtGEJCcZhBqHOLcAQqGRohNO4ehSoie5gKKunpP/3Mfr0kWZmc98WgapOL4k
 BzuwfD3ZHFN8SrWXwZEqhqbo7La36nOK4WLJ5UWU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220701002706epcas1p113cb9a3baabc0f597413b32f79379797~9jPYWUx-u3255832558epcas1p1z;
 Fri,  1 Jul 2022 00:27:06 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.132]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4LYwxj1ykvz4x9QH; Fri,  1 Jul
 2022 00:27:05 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 45.50.09657.95F3EB26; Fri,  1 Jul 2022 09:27:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220701002704epcas1p25ab6878a9c21a75aab727dd49171859e~9jPWuQnF22489424894epcas1p2M;
 Fri,  1 Jul 2022 00:27:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220701002704epsmtrp1fe3bfe1e96cb9cd283cc616bcab41096~9jPWtM00O2207222072epsmtrp1X;
 Fri,  1 Jul 2022 00:27:04 +0000 (GMT)
X-AuditID: b6c32a35-71dff700000025b9-c7-62be3f59b291
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F1.A7.08905.85F3EB26; Fri,  1 Jul 2022 09:27:04 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220701002702epsmtip19324f07764b919acde6d7a9e7f559267~9jPUYjXaT3142831428epsmtip12;
 Fri,  1 Jul 2022 00:27:02 +0000 (GMT)
From: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
In-Reply-To: <20220630231809.GA3514176-robh@kernel.org>
Subject: RE: [PATCH 1/2] drm/exynos: MAINTAINERS: move Joonyoung Shim to
 credits
Date: Fri, 1 Jul 2022 09:27:01 +0900
Message-ID: <003301d88ce1$49e82330$ddb86990$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJghn6p1dSqDKoivxgEEVwDdxk9yAKXUcLlA0cSKuMCrijEvqwUTSIg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNJsWRmVeSWpSXmKPExsWy7bCmrm6k/b4kg19beS16z51ksngwbxub
 xf9tE5kt5h85x2px5et7NosLT3vYLPpePGS22Pt6K7vF2aY37BabHl9jtbi8aw6bxYRV31gs
 Zpzfx2Txf88OdosZk1+yWey8c4LZQcBj77cFLB6bVnWyedy5tofNY/u3B6we97uPM3lsXlLv
 0bdlFaPH8RvbmTw+b5IL4IzKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshL
 zE21VXLxCdB1y8wBekNJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BaoFecmFtc
 mpeul5daYmVoYGBkClSYkJ3R9XIZW8E7yYqjW9exNzA2SXYxcnJICJhINK56w9TFyMUhJLCD
 UeL0pp1QzidGie9/epkhnG+MEt0NT5hhWratm8IOkdjLKHF7+XJWCOclo8Sm/SvBqtgE0iXu
 djcwgdgiAqoSTbMesIAUMQv8ZJGYevkZK0iCU8BcorftLyOILSwQJPHu318WEJtFQEXi26kV
 YM28ApYSp88sY4WwBSVOznwCVsMsoC2xbOFrqJMUJH4+hagREXCTOPD1AytEjYjE7M42sB8k
 BL5wSKw9sYgNosFFYsW8O6wQtrDEq+Nb2CFsKYmX/W3sEA2TGSXuXF/BAuHMYJQ4/PM6I0SV
 scT+pZOBzuMAWqEpsX6XPkRYUWLn77mMEJv5JN597WEFKZEQ4JXoaBOCKFGSOHbxBtQUCYkL
 SyayTWBUmoXkt1lIfpuF5IdZCMsWMLKsYhRLLSjOTU8tNiwwhEd4cn7uJkZwKtcy3cE48e0H
 vUOMTByMhxglOJiVRHjZ5u1NEuJNSaysSi3Kjy8qzUktPsRoCgzticxSosn5wGySVxJvaGJp
 YGJmZGxiYWhmqCTOu2ra6UQhgfTEktTs1NSC1CKYPiYOTqkGpoKl0csnmryf479Pa/lDH8ac
 WNd3fXb5Dk//sP+uq97dayN9Yt68GSkJr0I2cH5bfErNXjnp+x43hX9OfZExhYpify4YPFD+
 wbs4cdYz+5y0Xcs4Ejplb38r/BEeazb5+sWV4p/fqLiWPLEWnnMnpGGVnYJr1sUiLrWXC1bJ
 PtMJXfQ2LiLx+ba86QyqhoHHtd7tdf3aunnX3vTXQU+0F1qf335s1nPTlE3zVnmuF+/5yuTE
 8LIg89+jg+/+qh8P39ta86R2f95B/t2aSgn7N/xo3nzkxok35taLhYQWqf1b9n5+bNB9mYnq
 8ifW3F/1QnymRiOnVsS2JOaZbWYJJTu4XF/LctRUlTMw8145zKjEUpyRaKjFXFScCACFmc0g
 bgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsWy7bCSnG6E/b4kgy//VC16z51ksngwbxub
 xf9tE5kt5h85x2px5et7NosLT3vYLPpePGS22Pt6K7vF2aY37BabHl9jtbi8aw6bxYRV31gs
 Zpzfx2Txf88OdosZk1+yWey8c4LZQcBj77cFLB6bVnWyedy5tofNY/u3B6we97uPM3lsXlLv
 0bdlFaPH8RvbmTw+b5IL4IzisklJzcksSy3St0vgylh9Rqtgt3DFhsc1DYynBboYOTkkBEwk
 tq2bwt7FyMUhJLCbUeLzpMmMXYwcQAkJiS1bOSBMYYnDh4tByoUEnjNKPGxUB7HZBFIlbnz6
 yA5iiwioSjTNesACMoZZoJlVYuvp08wQDW8ZJe40BIPYnALmEr1tfxlBbGGBAImdR76CNbMI
 qEh8O7WCCcTmFbCUOH1mGSuELShxcuYTFhCbWUBbovdhKyOMvWzha2aI+xUkfj6FqBcRcJM4
 8PUDK0SNiMTszjbmCYzCs5CMmoVk1Cwko2YhaVnAyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0
 L10vOT93EyM4jrU0dzBuX/VB7xAjEwfjIUYJDmYlEV62eXuThHhTEiurUovy44tKc1KLDzFK
 c7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamBye+R75lLkwUuKMUfP232dtXdeqYvGzcQy
 7psrOBjT3s+c0Jhl9u+E0KYVz1b82XlrC8OxvW2fXmuIyd4S8npkeb13w6EjtaXn3U0Wzjdq
 jJt4Ye77B6fSwn6c/TbxcuGpCQZXFA8E7JwtyLZj6oWEbNO7X59/TA38dlaDSfLqj5Vicyo1
 eSy1Zknc0TwlVKMeJ2DAkf1H5uf/2FfTD63ViQj2qf61Re9V2By5vYeyUtNcvK9rC6yq/dpS
 O+2nApPpqylX1jkfb4z49nbf/8ap6i1SzrJfaqqW2pdMd7i1wDtbgnXBkf49nnX+c/4IrQiq
 7GjxyXBhZ3kvd2/jDufPz90ffHuf9vrq3HbmqHd/uJRYijMSDbWYi4oTAR7STMxSAwAA
X-CMS-MailID: 20220701002704epcas1p25ab6878a9c21a75aab727dd49171859e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220626163558epcas1p3f525431b9fb237bd420ad1453daaf1ac
References: <CGME20220626163558epcas1p3f525431b9fb237bd420ad1453daaf1ac@epcas1p3.samsung.com>
 <20220626163320.6393-1-krzysztof.kozlowski@linaro.org>
 <0de401d88c38$23aeb8e0$6b0c2aa0$@samsung.com>
 <20220630231809.GA3514176-robh@kernel.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: 'Vinod	Koul' <vkoul@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 'David Airlie' <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, 'Seung-Woo
 Kim' <sw0312.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>,
 dri-devel@lists.freedesktop.org, 'Kishon Vijay Abraham I' <kishon@ti.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, 'Alim Akhtar' <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring =5Bmailto:robh=40kernel.org=5D
> Sent: Friday, July 1, 2022 8:18 AM
> To: =EF=BF=BD=EF=BF=BD=EF=BF=BD=CE=B1=EF=BF=BD/Tizen=20Platform=20Lab(SR)=
/=EF=BF=BD=EF=BC=BA=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=20<inki.dae=40samsu=
ng.com>=0D=0A>=20Cc:=20'Krzysztof=20Kozlowski'=20<krzysztof.kozlowski=40lin=
aro.org>;=20'Seung-Woo=20Kim'=0D=0A>=20<sw0312.kim=40samsung.com>;=20'Kyung=
min=20Park'=0D=0A>=20<kyungmin.park=40samsung.com>;=20'David=20Airlie'=20<a=
irlied=40linux.ie>;=20'Daniel=0D=0A>=20Vetter'=20<daniel=40ffwll.ch>;=20'Kr=
zysztof=20Kozlowski'=0D=0A>=20<krzysztof.kozlowski+dt=40linaro.org>;=20'Ali=
m=20Akhtar'=0D=0A>=20<alim.akhtar=40samsung.com>;=20'Kishon=20Vijay=20Abrah=
am=20I'=20<kishon=40ti.com>;=0D=0A>=20'Vinod=20Koul'=20<vkoul=40kernel.org>=
;=20linux-kernel=40vger.kernel.org;=20dri-=0D=0A>=20devel=40lists.freedeskt=
op.org;=20devicetree=40vger.kernel.org;=20linux-arm-=0D=0A>=20kernel=40list=
s.infradead.org;=20linux-samsung-soc=40vger.kernel.org;=20linux-=0D=0A>=20p=
hy=40lists.infradead.org=0D=0A>=20Subject:=20Re:=20=5BPATCH=201/2=5D=20drm/=
exynos:=20MAINTAINERS:=20move=20Joonyoung=20Shim=0D=0A>=20to=20credits=0D=
=0A>=20=0D=0A>=20On=20Thu,=20Jun=2030,=202022=20at=2001:16:14PM=20+0900,=20=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=CE=B1=EF=BF=BD/Tizen=20Platform=20Lab(SR)/=EF=
=BF=BD=0D=0A>=20=EF=BC=BA=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=20wrote:=0D=
=0A>=20>=0D=0A>=20>=0D=0A>=20>=20>=20-----Original=20Message-----=0D=0A>=20=
>=20>=20From:=20Krzysztof=20Kozlowski=20=5Bmailto:krzysztof.kozlowski=40lin=
aro.org=5D=0D=0A>=20>=20>=20Sent:=20Monday,=20June=2027,=202022=201:33=20AM=
=0D=0A>=20>=20>=20To:=20Inki=20Dae=20<inki.dae=40samsung.com>;=20Seung-Woo=
=20Kim=0D=0A>=20>=20>=20<sw0312.kim=40samsung.com>;=20Kyungmin=20Park=0D=0A=
>=20<kyungmin.park=40samsung.com>;=20David=0D=0A>=20>=20>=20Airlie=20<airli=
ed=40linux.ie>;=20Daniel=20Vetter=20<daniel=40ffwll.ch>;=20Rob=20Herring=0D=
=0A>=20>=20>=20<robh+dt=40kernel.org>;=20Krzysztof=20Kozlowski=0D=0A>=20>=
=20>=20<krzysztof.kozlowski+dt=40linaro.org>;=20Alim=20Akhtar=0D=0A>=20>=20=
<alim.akhtar=40samsung.com>;=0D=0A>=20>=20>=20Kishon=20Vijay=20Abraham=20I=
=20<kishon=40ti.com>;=20Vinod=20Koul=20<vkoul=40kernel.org>;=0D=0A>=20>=20>=
=20linux-kernel=40vger.kernel.org;=20dri-devel=40lists.freedesktop.org;=0D=
=0A>=20>=20>=20devicetree=40vger.kernel.org;=20linux-arm-kernel=40lists.inf=
radead.org;=20linux-=0D=0A>=20>=20>=20samsung-soc=40vger.kernel.org;=20linu=
x-phy=40lists.infradead.org=0D=0A>=20>=20>=20Cc:=20Krzysztof=20Kozlowski=20=
<krzysztof.kozlowski=40linaro.org>=0D=0A>=20>=20>=20Subject:=20=5BPATCH=201=
/2=5D=20drm/exynos:=20MAINTAINERS:=20move=20Joonyoung=20Shim=0D=0A>=20to=0D=
=0A>=20>=20>=20credits=0D=0A>=20>=20>=0D=0A>=20>=20>=20Emails=20to=20Joonyo=
ung=20Shim=20bounce=20(=22550=205.1.1=20Recipient=20address=20rejected:=0D=
=0A>=20>=20>=20User=20unknown=22),=20so=20move=20him=20to=20credits=20file.=
=0D=0A>=20>=20>=0D=0A>=20>=0D=0A>=20>=20Applied.=0D=0A>=20=0D=0A>=20Both=20=
patches=20or=20just=20this=20one?=0D=0A=0D=0AAh,=20didn't=20check=20it.=20I=
=20will=20take=20other=20one=20too.=20Please=20let=20me=20know=20if=20there=
=20is=20any=20problem.=0D=0A=0D=0AThanks,=0D=0AInki=20Dae=0D=0A=0D=0A
