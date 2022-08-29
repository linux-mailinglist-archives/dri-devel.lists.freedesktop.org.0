Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2DE5A4AAE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 13:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B259910E4CC;
	Mon, 29 Aug 2022 11:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658BF10E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661773612;
 bh=TCsbJLy6vdtpY4oueVXpZOnf2TH500SbVGPVxylpSkk=;
 h=X-UI-Sender-Class:From:Subject:Date:To;
 b=Loc5aqCoobXmBES4lhisSv6KAIotTkPQvONpzA7AVFueQqDr9XbCg8uq04dXz+rsr
 KeSZtjVU4Z26Xx60D8h4VAorj9zRfYUL/Yg8XVqnMfTz+0qBCuuv6+Xl7KmerHdBDE
 tyWuqSyYBRXPDa189T+jD0O5bUOw3z3b/pGEB5PQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from smtpclient.apple ([109.42.176.213]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1ohpPn3xEN-00LlpR for
 <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:41:49 +0200
Content-Type: multipart/alternative;
 boundary=Apple-Mail-1D80E001-C9B7-4D84-976F-278CF0774AD8
Content-Transfer-Encoding: 7bit
From: Stefan Eschenbacher <Stefan.Eschenbacher@gmx.de>
Mime-Version: 1.0 (1.0)
Subject: Aw: [PATCH 1/2] drm/etnaviv: add HWDB entry for GC7000 r6203
Message-Id: <58921853-0744-4481-8A9B-68653B04A8BC@gmx.de>
Date: Mon, 29 Aug 2022 13:41:47 +0200
To: dri-devel@lists.freedesktop.org
X-Mailer: iPhone Mail (19G82)
X-Provags-ID: V03:K1:G7XTU7oVzb1LchZVG+aq4007omaIqb6gtdR5KVpQtZJGPy//Scg
 MHn44nWQmOkterLTio9jJvI0sPmFqfgONED6/NuiRLQ7AxAnT+rN3n0q2p+V4jI9/lmQ8WV
 fTvQPivVZEpbrOlZVsKOsbowRvTKRUPsEQcn7p4XznbmiXvY52QCA7EXFlVY5tvJaJdnIfW
 jvrmaTUQSJGV/KnW5mAtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:shwaBjmaQQM=:Iatj9cPBH8xVwha8o8eOXT
 Uj7og46dC1CCkp3ahCyEe6I9D7gJHTjyDuPynB6yUlVpyCjZA0LbY1zNjQXxtWmtmPRmlPBQo
 sXcLtVzDKA1qsWmjJX2uObDg3odLkx75mGxx0YijtilECXe3DXgM7UkeoUzhZi1MYTSlLYcIh
 fSvU9IcDRhLIglBVnmmSgKN8tX0HanzGBRS9XBrGGzV2KaA2vuY+PFW23QzsS0wRcJ0IMgmMi
 rPlNoBNDEtdDuDmvRiPjovr7jq9JZktIMlZJy704Gt8kN0cBXHwCBEPiL5OAk6ZLU+5ldPXCM
 +ZjmZeNKAhVwKKVYrKLBvpVJ6ASoM0B88lpCOp4mK1VfTjEm4v3n5yR1TWx59PRoLs0Q0PtmH
 QkzpsyVSql5gGjW8884SQM1FXRgvK8BTP+Nbpj39x9KlxL2KuMSZ22nXF6oX0/dYAT9f5JIfq
 55r2SUcSRTm9GNVZZki0g0nmxB7RPZx1mKRk+BFLJ2z3w+k5l7d9okw6IMRu44BwoR4zuSF6q
 i69vp4E4ibpgoAxltXmCWlTn3iS1J7lxWWRLVvmxRNgl6DL5ndMeNR8lyK0P/eG4bwdBx1u3S
 hnGheLqO75FCOxeBSzXzgGleAtbWLmmFDCMG0rWksnNls3mBwohH2xixsyt8G0Mqp9vUerOFQ
 gJUJZ+ZiYIFURhh1ZEW6bxPwxgdquQ49wxd1fpZI+9C3+L7movxbxhOq8l7Dc/HsFLqbwihnh
 4wStxdv9Yr7rNLo/eexX/9b0yc+bAENnDDs/qvbhz9uX9cqkkJ97M5/yNgTvV1YNJ1eueS4VY
 M03A8bwOGtoYHVJ0t/RhXWGpvU/R9HdW2Tjmcud6KXS9TajWc5k+s2h3FCY2d/9tkClxxrwfp
 IPugVZ3VyzxIAPyjCzJi4USBX88IgfZHZzeTWlELPcuSlMSchG10dRKtK6nyQN05CwD160rJr
 qelw2J/oPhnm4O2+IcII7vk7r9Bq1le10nBaMmAAgoKHwqFTHWcN7oRDPXHySznuCtpDZVxTV
 miC6J8UmGolBcCGFjca8n5Zq9XNcqlniqf7Y7EK+XZhkkSxP90r3FShftOpUGEmly8tQMnGKf
 Gr0eAORsDzqT8FJ2S2dcivdLsvdKwIFEOfAtSI5mZEAJ2Zlt94qrGkl+g==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail-1D80E001-C9B7-4D84-976F-278CF0774AD8
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Product_id, customer_id and eco_id should not be zero. The different version=
s of model 0x7000, revision 0x6203 can differ in stream_count, minor_feature=
5 and minor_features7.
=20
                {
                               .model =3D 0x7000,
                               .revision =3D 0x6203,
                               .product_id =3D 0x70003,
                               .customer_id =3D 0x4,
                               .eco_id =3D 0,
                               .stream_count =3D 16,
                               .register_max =3D 64,
                               .thread_count =3D 512,
                               .shader_core_count =3D 2,
                               .vertex_cache_size =3D 16,
                               .vertex_output_buffer_size =3D 1024,
                               .pixel_pipes =3D 1,
                               .instruction_count =3D 512,
                               .num_constants =3D 320,
                               .buffer_size =3D 0,
                               .varyings_count =3D 16,
                               .features =3D 0xe0287c8d,
                               .minor_features0 =3D 0xc1799eff,
                               .minor_features1 =3D 0xfefbfad9,
                               .minor_features2 =3D 0xeb9d4fbf,
                               .minor_features3 =3D 0xedfffced,
                               .minor_features4 =3D 0xdb0dafc7,
                               .minor_features5 =3D 0x3b5ac333,
                               .minor_features6 =3D 0xfcce6000,
                               .minor_features7 =3D 0xfffbfa6f,
                               .minor_features8 =3D 0x00e10ef3,
                               .minor_features9 =3D 0x00c8003c,
                               .minor_features10 =3D 0x00004040,
                               .minor_features11 =3D 0x00000024,
                },
                {
                               .model =3D 0x7000,
                               .revision =3D 0x6203,
                               .product_id =3D 0x7000f,
                               .customer_id =3D 0x60,
                               .eco_id =3D 0,
                               .stream_count =3D 8,
                               .register_max =3D 64,
                               .thread_count =3D 512,
                               .shader_core_count =3D 2,
                               .vertex_cache_size =3D 16,
                               .vertex_output_buffer_size =3D 1024,
                               .pixel_pipes =3D 1,
                               .instruction_count =3D 512,
                               .num_constants =3D 320,
                               .buffer_size =3D 0,
                               .varyings_count =3D 16,
                               .features =3D 0xe0287c8d,
                                .minor_features0 =3D 0xc1799eff,
                               .minor_features1 =3D 0xfefbfad9,
                               .minor_features2 =3D 0xeb9d4fbf,
                               .minor_features3 =3D 0xedfffced,
                               .minor_features4 =3D 0xdb0dafc7,
                               .minor_features5 =3D 0x7b5ac333,
                               .minor_features6 =3D 0xfcce6000,
                               .minor_features7 =3D 0x1bfbfa6f,
                               .minor_features8 =3D 0x00e10ef0,
                               .minor_features9 =3D 0x00c8003c,
                               .minor_features10 =3D 0x00004040,
                               .minor_features11 =3D 0x00000024,
                },

Take a look in the stm32 hwdb file.=

--Apple-Mail-1D80E001-C9B7-4D84-976F-278CF0774AD8
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><meta http-equiv=3D"conten=
t-type" content=3D"text/html; charset=3Dutf-8"><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: C=
alibri, sans-serif;"><span lang=3D"EN-US">Product_id, customer_id and eco_id=
 should not be zero. The different versions of model 0x7000, revision 0x6203=
 can differ in stream_count, minor_feature5 and minor_features7.<o:p></o:p><=
/span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; ma=
rgin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D=
"EN-US">&nbsp;</span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-a=
djust: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;=
"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p><p class=3D"Mso=
Normal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11p=
t; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; .model =3D 0x7000,<o:p></o:p></span></p><p class=3D"MsoNormal" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-f=
amily: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .revision =3D 0x6203,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: C=
alibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .prod=
uct_id =3D 0x70003,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Cali=
bri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .custome=
r_id =3D 0x4,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-t=
ext-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, s=
ans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .eco_id =3D 0,=
<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adju=
st: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><=
span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .stream_count =3D 16,<o:p><=
/o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: au=
to; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span l=
ang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .register_max =3D 64,<o:p></o:p><=
/span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; ma=
rgin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D=
"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .thread_count =3D 512,<o:p></o:p></span=
></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin:=
 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-U=
S">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shader_core_count =3D 2,<o:p></o:p></span><=
/p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0=
cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .vertex_cache_size =3D 16,<o:p></o:p></span></=
p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0c=
m; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; .vertex_output_buffer_size =3D 1024,<o:p></o:p>=
</span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D=
"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .pixel_pipes =3D 1,<o:p></o:p></span></=
p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0c=
m; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; .instruction_count =3D 512,<o:p></o:p></span></=
p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0c=
m; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_constants =3D 320,<o:p></o:p></span></p><p=
 class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; f=
ont-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; .buffer_size =3D 0,<o:p></o:p></span></p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size:=
 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; .varyings_count =3D 16,<o:p></o:p></span></p><p class=3D"Mso=
Normal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11p=
t; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; .features =3D 0xe0287c8d,<o:p></o:p></span></p><p class=3D"MsoNo=
rmal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt;=
 font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; .minor_features0 =3D 0xc1799eff,<o:p></o:p></span></p><p class=3D"=
MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 1=
1pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; .minor_features1 =3D 0xfefbfad9,<o:p></o:p></span></p><p class=
=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-si=
ze: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; .minor_features2 =3D 0xeb9d4fbf,<o:p></o:p></span></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; fon=
t-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; .minor_features3 =3D 0xedfffced,<o:p></o:p></span></p=
><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm=
; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features4 =3D 0xdb0dafc7,<o:p></o:p></spa=
n></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin=
: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-=
US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features5 =3D 0x3b5ac333,<o:p></o:p>=
</span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D=
"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features6 =3D 0xfcce6000,<o:p></=
o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: aut=
o; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span la=
ng=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features7 =3D 0xfffbfa6f,<o=
:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust=
: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><sp=
an lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features8 =3D 0x00e10e=
f3,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-a=
djust: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;=
"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features9 =3D 0x0=
0c8003c,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-s=
ize-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-s=
erif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features10 =3D=
 0x00004040,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-te=
xt-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sa=
ns-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features=
11 =3D 0x00000024,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-web=
kit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calib=
ri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p=
><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm=
; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; {<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit=
-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calibri,=
 sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .model =3D 0=
x7000,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-siz=
e-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-ser=
if;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .revision =3D 0x6203,=
<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adju=
st: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><=
span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .product_id =3D 0x7000f,<o:=
p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust:=
 auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><spa=
n lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .customer_id =3D 0x60,<o:p></o=
:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto=
; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lan=
g=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .eco_id =3D 0,<o:p></o:p></span></p=
><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm=
; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; .stream_count =3D 8,<o:p></o:p></span></p><p cla=
ss=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-=
size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; .register_max =3D 64,<o:p></o:p></span></p><p class=3D"=
MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 1=
1pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; .thread_count =3D 512,<o:p></o:p></span></p><p class=3D"MsoNor=
mal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; f=
ont-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; .shader_core_count =3D 2,<o:p></o:p></span></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; fon=
t-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .vertex_cache_size =3D 16,<o:p></o:p></span></p><p class=3D"MsoNormal"=
 style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font=
-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; .vertex_output_buffer_size =3D 1024,<o:p></o:p></span></p><p class=3D"M=
soNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 1=
1pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; .pixel_pipes =3D 1,<o:p></o:p></span></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; fon=
t-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .instruction_count =3D 512,<o:p></o:p></span></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; fon=
t-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .num_constants =3D 320,<o:p></o:p></span></p><p class=3D"MsoNormal" st=
yle=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-fa=
mily: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; .buffer_size =3D 0,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-=
webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Ca=
libri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .varyi=
ngs_count =3D 16,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webk=
it-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calibr=
i, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .features =3D=
 0xe0287c8d,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-webkit-te=
xt-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sa=
ns-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_feature=
s0 =3D 0xc1799eff,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"-web=
kit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: Calib=
ri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_fe=
atures1 =3D 0xfefbfad9,<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-family: C=
alibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .mino=
r_features2 =3D 0xeb9d4fbf,<o:p></o:p></span></p><p class=3D"MsoNormal" styl=
e=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-fami=
ly: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .=
minor_features3 =3D 0xedfffced,<o:p></o:p></span></p><p class=3D"MsoNormal" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; font-f=
amily: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .minor_features4 =3D 0xdb0dafc7,<o:p></o:p></span></p><p class=3D"MsoNorm=
al" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11pt; f=
ont-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; .minor_features5 =3D 0x7b5ac333,<o:p></o:p></span></p><p class=3D"Ms=
oNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size: 11=
pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; .minor_features6 =3D 0xfcce6000,<o:p></o:p></span></p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-size:=
 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; .minor_features7 =3D 0x1bfbfa6f,<o:p></o:p></span></p><p cla=
ss=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; font-=
size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; .minor_features8 =3D 0x00e10ef0,<o:p></o:p></span></p><=
p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0cm; f=
ont-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; .minor_features9 =3D 0x00c8003c,<o:p></o:p></span><=
/p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0=
cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"EN-US"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor_features10 =3D 0x00004040,<o:p></o:p></=
span></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; mar=
gin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><span lang=3D"=
EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>.minor_features11 =3D 0x0000=
0024,<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust=
: auto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; },</p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: a=
uto; margin: 0cm; font-size: 11pt; font-family: Calibri, sans-serif;"><br></=
p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0c=
m; font-size: 11pt; font-family: Calibri, sans-serif;">Take a look in the st=
m32 hwdb file.</p></div></body></html>=

--Apple-Mail-1D80E001-C9B7-4D84-976F-278CF0774AD8--
