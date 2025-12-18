Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E4DCCA51D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 06:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690FC10E5AF;
	Thu, 18 Dec 2025 05:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com
 [207.226.244.123])
 by gabe.freedesktop.org (Postfix) with ESMTP id D737210E5AF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:26:03 +0000 (UTC)
X-CSE-ConnectionGUID: 6LycU3voR5CU5rUGg3y+YQ==
X-CSE-MsgGUID: 3ByA0UtlRB6kR5dvIHQyzA==
X-IronPort-AV: E=Sophos;i="6.21,156,1763395200"; 
 d="scan'208,217";a="161694889"
From: =?gb2312?B?uN/P6A==?= <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>, Xiang Gao <gxxa03070307@gmail.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "dhowells@redhat.com"
 <dhowells@redhat.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "brauner@kernel.org" <brauner@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW0V4dGVybmFsIE1haWxdUmU6IFtQQVRDSCB2N10gZG1hLWJ1Zjog?=
 =?gb2312?Q?add_some_tracepoints_to_debug.?=
Thread-Topic: [External Mail]Re: [PATCH v7] dma-buf: add some tracepoints to
 debug.
Thread-Index: AQHcb2z9cDaOU3OkoU6L6VWWiGOnOLUm3kym
Date: Thu, 18 Dec 2025 05:24:36 +0000
Message-ID: <f48da27cfb3f4052958c97d2eb7244b3@xiaomi.com>
References: <20251217105132.643300-1-gxxa03070307@gmail.com>,
 <20251217105239.713bab41@gandalf.local.home>
In-Reply-To: <20251217105239.713bab41@gandalf.local.home>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.88.13]
Content-Type: multipart/alternative;
 boundary="_000_f48da27cfb3f4052958c97d2eb7244b3xiaomicom_"
MIME-Version: 1.0
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

--_000_f48da27cfb3f4052958c97d2eb7244b3xiaomicom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

b2ssIHRoYW5rcy4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzog
U3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+DQq3osvNyrG85DogMjAyNcTqMTLU
wjE3yNUgMjM6NTI6MzkNCsrVvP7IyzogWGlhbmcgR2FvDQqzrcvNOiBzdW1pdC5zZW13YWxAbGlu
YXJvLm9yZzsgY2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tOyBtaGlyYW1hdEBrZXJuZWwub3JnOyBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG1hdGhpZXUuZGVzbm95ZXJzQGVmZmlj
aW9zLmNvbTsgZGhvd2VsbHNAcmVkaGF0LmNvbTsga3ViYUBrZXJuZWwub3JnOyBicmF1bmVyQGtl
cm5lbC5vcmc7IGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc7IGxpbnV4LXRyYWNlLWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7ILjfz+gNCtb3zOI6IFtFeHRlcm5hbCBNYWlsXVJlOiBbUEFUQ0ggdjdd
IGRtYS1idWY6IGFkZCBzb21lIHRyYWNlcG9pbnRzIHRvIGRlYnVnLg0KDQpbzeKyv9PKvP5dILTL
08q8/sC01LTT2tChw9e5q8u+zeKyv6Osx+u998n3tKbA7aGjyPS21NPKvP6wssir0NS05tLJo6zH
672r08q8/teqt6K4+G1pc2VjQHhpYW9taS5jb229+NDQt7TAoQ0KDQpPbiBXZWQsIDE3IERlYyAy
MDI1IDE4OjUxOjMyICswODAwDQpYaWFuZyBHYW8gPGd4eGEwMzA3MDMwN0BnbWFpbC5jb20+IHdy
b3RlOg0KDQo+IEZyb206IGdhb3hpYW5nMTcgPGdhb3hpYW5nMTdAeGlhb21pLmNvbT4NCj4NCj4g
U2luY2Ugd2UgY2FuIG9ubHkgaW5zcGVjdCBkbWFidWYgYnkgaXRlcmF0aW5nIG92ZXIgcHJvY2Vz
cyBGRHMgb3IgdGhlDQo+IGRtYWJ1Zl9saXN0LCB3ZSBuZWVkIHRvIGFkZCBvdXIgb3duIHRyYWNl
cG9pbnRzIHRvIHRyYWNrIGl0cyBzdGF0dXMgaW4NCj4gcmVhbCB0aW1lIGluIHByb2R1Y3Rpb24u
DQo+DQo+IEZvciBleGFtcGxlOg0KPiAgICBiaW5kZXI6MzAxNl8xLTMxMDIgICAgWzAwNl0gLi4u
MS4gICAyNTUuMTI2NTIxOiBkbWFfYnVmX2V4cG9ydDogZXhwX25hbWU9cWNvbSxzeXN0ZW0gc2l6
ZT0xMjY4NTMxMiBpbm89MjczOA0KPiAgICBiaW5kZXI6MzAxNl8xLTMxMDIgICAgWzAwNl0gLi4u
MS4gICAyNTUuMTI2NTI4OiBkbWFfYnVmX2ZkOiBleHBfbmFtZT1xY29tLHN5c3RlbSBzaXplPTEy
Njg1MzEyIGlubz0yNzM4IGZkPTgNCj4gICAgYmluZGVyOjMwMTZfMS0zMTAyICAgIFswMDZdIC4u
LjEuICAgMjU1LjEyNjY0MjogZG1hX2J1Zl9tbWFwX2ludGVybmFsOiBleHBfbmFtZT1xY29tLHN5
c3RlbSBzaXplPTI4NjcyIGlubz0yNzM5DQo+ICAgICAga3dvcmtlci82OjEtODYgICAgICBbMDA2
XSAuLi4xLiAgIDI1NS4xMjcxOTQ6IGRtYV9idWZfcHV0OiBleHBfbmFtZT1xY29tLHN5c3RlbSBz
aXplPTEyNjg1MzEyIGlubz0yNzM4DQo+ICAgICBSZW5kZXJUaHJlYWQtOTI5MyAgICBbMDA2XSAu
Li4xLiAgIDMxNi42MTgxNzk6IGRtYV9idWZfZ2V0OiBleHBfbmFtZT1xY29tLHN5c3RlbSBzaXpl
PTEyNzcxMzI4IGlubz0yNzYyIGZkPTE3Ng0KPiAgICAgUmVuZGVyVGhyZWFkLTkyOTMgICAgWzAw
Nl0gLi4uMS4gICAzMTYuNjE4MTk1OiBkbWFfYnVmX2R5bmFtaWNfYXR0YWNoOiBleHBfbmFtZT1x
Y29tLHN5c3RlbSBzaXplPTEyNzcxMzI4IGlubz0yNzYyIGF0dGFjaG1lbnQ6ZmZmZmZmODgwYTE4
ZGQwMCBpc19keW5hbWljPTAgZGV2X25hbWU9a2dzbC0zZDANCj4gICAgIFJlbmRlclRocmVhZC05
MjkzICAgIFswMDZdIC4uLjEuICAgMzE4Ljg3ODIyMDogZG1hX2J1Zl9kZXRhY2g6IGV4cF9uYW1l
PXFjb20sc3lzdGVtIHNpemU9MTI3NzEzMjggaW5vPTI3NjIgYXR0YWNobWVudDpmZmZmZmY4ODBh
MThkZDAwIGlzX2R5bmFtaWM9MCBkZXZfbmFtZT1rZ3NsLTNkMA0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBYaWFuZyBHYW8gPGdhb3hpYW5nMTdAeGlhb21pLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi5jICAgICAgfCAgNDIgKysrKysrKystDQo+ICBpbmNsdWRlL3RyYWNlL2V2
ZW50cy9kbWFfYnVmLmggfCAxNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDE5OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS90cmFjZS9ldmVudHMvZG1hX2J1Zi5oDQo+DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYw0KPiBpbmRleCAyYmNmOWNlY2E5OTcuLmNlMzliYzE5ZTEzZiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jDQo+IEBAIC0zNSw2ICszNSwyNSBAQA0KPg0KPiAgI2luY2x1ZGUgImRtYS1idWYtc3lz
ZnMtc3RhdHMuaCINCj4NCj4gKyNkZWZpbmUgQ1JFQVRFX1RSQUNFX1BPSU5UUw0KPiArI2luY2x1
ZGUgPHRyYWNlL2V2ZW50cy9kbWFfYnVmLmg+DQo+ICsNCj4gKy8qDQo+ICsgKiBkbWFidWYtPm5h
bWUgbXVzdCBiZSBhY2Nlc3NlZCB3aXRoIGhvbGRpbmcgZG1hYnVmLT5uYW1lX2xvY2suDQo+ICsg
KiB3ZSBuZWVkIHRvIHRha2UgdGhlIGxvY2sgYXJvdW5kIHRoZSB0cmFjZXBvaW50IGNhbGwgaXRz
ZWxmIHdoZXJlDQo+ICsgKiBpdCBpcyBjYWxsZWQgaW4gdGhlIGNvZGUuDQo+ICsgKg0KPiArICog
Tm90ZTogRlVOQyMjX2VuYWJsZWQoKSBpcyBhIHN0YXRpYyBicmFuY2ggdGhhdCB3aWxsIG9ubHkN
Cj4gKyAqICAgICAgIGJlIHNldCB3aGVuIHRoZSB0cmFjZSBldmVudCBpcyBlbmFibGVkLg0KPiAr
ICovDQoNCk11Y2ggYmV0dGVyLg0KDQo+ICsjZGVmaW5lIERNQV9CVUZfVFJBQ0UoRlVOQywgLi4u
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgIGRvIHsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAgaWYgKEZVTkMjI19lbmFi
bGVkKCkpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgIGd1YXJkKHNwaW5sb2NrKSgmZG1hYnVmLT5uYW1lX2xvY2spOyAg
ICBcDQo+ICsgICAgICAgICAgICAgICAgICAgICBGVU5DKF9fVkFfQVJHU19fKTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICAgICAgIH0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQoNCkhtbSwgSSB3b25kZXIgaWYgd2Ugc2hv
dWxkIGFsc28gYWRkOg0KDQogICAgICAgICAgICAgICAgfSBlbHNlIGlmIChJU19FTkFCTEVEKENP
TkZJR19MT0NLREVQKSkgeyBcDQogICAgICAgICAgICAgICAgICAgICAgICAvKiBFeHBvc2UgdGhp
cyBsb2NrIHdoZW4gbG9ja2RlcCBpcyBlbmFibGVkICovIFwNCiAgICAgICAgICAgICAgICAgICAg
ICAgIGd1YXJkKHNwaW5sb2NrKSgmZG1hYnVmLT5uYW1lX2xvY2spOyAgICBcDQogICAgICAgICAg
ICAgICAgfQ0KDQpUaGlzIHdheSwgaWYgdGhlcmUgaXMgYW55IGlzc3VlIHRha2luZyB0aGUgbG9j
aywgbG9ja2RlcCB3aWxsIGZsYWcgaXQNCndpdGhvdXQgaGF2aW5nIHRvIGVuYWJsZSB0aGUgdHJh
Y2Vwb2ludC4NCg0KV2hlbiBMT0NLREVQIGlzIG5vdCBjb25maWd1cmVkLCB0aGUgY29tcGlsZXIg
c2hvdWxkIHJlbW92ZSB0aGF0IGJsb2NrLg0KDQo+ICsgICAgIH0gd2hpbGUgKDApDQo+ICsNCj4g
IHN0YXRpYyBpbmxpbmUgaW50IGlzX2RtYV9idWZfZmlsZShzdHJ1Y3QgZmlsZSAqKTsNCj4NCj4N
Cg0KDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZG1hX2J1
Zi5oDQo+IEBAIC0wLDAgKzEsMTU3IEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCAqLw0KPiArI3VuZGVmIFRSQUNFX1NZU1RFTQ0KPiArI2RlZmluZSBUUkFDRV9TWVNU
RU0gZG1hX2J1Zg0KPiArDQo+ICsjaWYgIWRlZmluZWQoX1RSQUNFX0RNQV9CVUZfSCkgfHwgZGVm
aW5lZChUUkFDRV9IRUFERVJfTVVMVElfUkVBRCkNCj4gKyNkZWZpbmUgX1RSQUNFX0RNQV9CVUZf
SA0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPg0KPiArI2luY2x1ZGUgPGxpbnV4
L3RyYWNlcG9pbnQuaD4NCj4gKw0KPiArREVDTEFSRV9FVkVOVF9DTEFTUyhkbWFfYnVmLA0KPiAr
DQo+ICsgICAgIFRQX1BST1RPKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpLA0KPiArDQo+ICsgICAg
IFRQX0FSR1MoZG1hYnVmKSwNCj4gKw0KPiArICAgICBUUF9TVFJVQ1RfX2VudHJ5KA0KPiArICAg
ICAgICAgICAgIF9fc3RyaW5nKGV4cF9uYW1lLCBkbWFidWYtPmV4cF9uYW1lKQ0KPiArICAgICAg
ICAgICAgIF9fZmllbGQoc2l6ZV90LCBzaXplKQ0KPiArICAgICAgICAgICAgIF9fZmllbGQoaW5v
X3QsIGlubykNCj4gKyAgICAgKSwNCj4gKw0KPiArICAgICBUUF9mYXN0X2Fzc2lnbigNCj4gKyAg
ICAgICAgICAgICBfX2Fzc2lnbl9zdHIoZXhwX25hbWUpOw0KPiArICAgICAgICAgICAgIF9fZW50
cnktPnNpemUgPSBkbWFidWYtPnNpemU7DQo+ICsgICAgICAgICAgICAgX19lbnRyeS0+aW5vID0g
ZG1hYnVmLT5maWxlLT5mX2lub2RlLT5pX2lubzsNCj4gKyAgICAgKSwNCj4gKw0KPiArICAgICBU
UF9wcmludGsoImV4cF9uYW1lPSVzIHNpemU9JXp1IGlubz0lbHUiLA0KPiArICAgICAgICAgICAg
ICAgX19nZXRfc3RyKGV4cF9uYW1lKSwNCj4gKyAgICAgICAgICAgICAgIF9fZW50cnktPnNpemUs
DQo+ICsgICAgICAgICAgICAgICBfX2VudHJ5LT5pbm8pDQo+ICspOw0KDQpGb3IgdGhlIHJlc3Qg
b2YgdGhlIHBhdGNoLCBmcm9tIGEgdHJhY2luZyBwb2ludCBvZiB2aWV3Og0KDQpSZXZpZXdlZC1i
eTogU3RldmVuIFJvc3RlZHQgKEdvb2dsZSkgPHJvc3RlZHRAZ29vZG1pcy5vcmc+DQoNCi0tIFN0
ZXZlDQo=

--_000_f48da27cfb3f4052958c97d2eb7244b3xiaomicom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>ok, thanks.</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Steve=
n Rostedt &lt;rostedt@goodmis.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2025=C4=EA12=D4=C217=C8=D5 23:52:39<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Xiang Gao<br>
<b>=B3=AD=CB=CD:</b> sumit.semwal@linaro.org; christian.koenig@amd.com; mhi=
ramat@kernel.org; linux-media@vger.kernel.org; dri-devel@lists.freedesktop.=
org; linux-kernel@vger.kernel.org; mathieu.desnoyers@efficios.com; dhowells=
@redhat.com; kuba@kernel.org; brauner@kernel.org;
 akpm@linux-foundation.org; linux-trace-kernel@vger.kernel.org; =B8=DF=CF=
=E8<br>
<b>=D6=F7=CC=E2:</b> [External Mail]Re: [PATCH v7] dma-buf: add some tracep=
oints to debug.</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">[=CD=E2=B2=BF=D3=CA=BC=FE] =B4=CB=D3=CA=BC=FE=C0=
=B4=D4=B4=D3=DA=D0=A1=C3=D7=B9=AB=CB=BE=CD=E2=B2=BF=A3=AC=C7=EB=BD=F7=C9=F7=
=B4=A6=C0=ED=A1=A3=C8=F4=B6=D4=D3=CA=BC=FE=B0=B2=C8=AB=D0=D4=B4=E6=D2=C9=A3=
=AC=C7=EB=BD=AB=D3=CA=BC=FE=D7=AA=B7=A2=B8=F8misec@xiaomi.com=BD=F8=D0=D0=
=B7=B4=C0=A1<br>
<br>
On Wed, 17 Dec 2025 18:51:32 &#43;0800<br>
Xiang Gao &lt;gxxa03070307@gmail.com&gt; wrote:<br>
<br>
&gt; From: gaoxiang17 &lt;gaoxiang17@xiaomi.com&gt;<br>
&gt;<br>
&gt; Since we can only inspect dmabuf by iterating over process FDs or the<=
br>
&gt; dmabuf_list, we need to add our own tracepoints to track its status in=
<br>
&gt; real time in production.<br>
&gt;<br>
&gt; For example:<br>
&gt;&nbsp;&nbsp;&nbsp; binder:3016_1-3102&nbsp;&nbsp;&nbsp; [006] ...1.&nbs=
p;&nbsp; 255.126521: dma_buf_export: exp_name=3Dqcom,system size=3D12685312=
 ino=3D2738<br>
&gt;&nbsp;&nbsp;&nbsp; binder:3016_1-3102&nbsp;&nbsp;&nbsp; [006] ...1.&nbs=
p;&nbsp; 255.126528: dma_buf_fd: exp_name=3Dqcom,system size=3D12685312 ino=
=3D2738 fd=3D8<br>
&gt;&nbsp;&nbsp;&nbsp; binder:3016_1-3102&nbsp;&nbsp;&nbsp; [006] ...1.&nbs=
p;&nbsp; 255.126642: dma_buf_mmap_internal: exp_name=3Dqcom,system size=3D2=
8672 ino=3D2739<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kworker/6:1-86&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; [006] ...1.&nbsp;&nbsp; 255.127194: dma_buf_put: exp_name=3Dqcom,syste=
m size=3D12685312 ino=3D2738<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; RenderThread-9293&nbsp;&nbsp;&nbsp; [006] ...1=
.&nbsp;&nbsp; 316.618179: dma_buf_get: exp_name=3Dqcom,system size=3D127713=
28 ino=3D2762 fd=3D176<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; RenderThread-9293&nbsp;&nbsp;&nbsp; [006] ...1=
.&nbsp;&nbsp; 316.618195: dma_buf_dynamic_attach: exp_name=3Dqcom,system si=
ze=3D12771328 ino=3D2762 attachment:ffffff880a18dd00 is_dynamic=3D0 dev_nam=
e=3Dkgsl-3d0<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; RenderThread-9293&nbsp;&nbsp;&nbsp; [006] ...1=
.&nbsp;&nbsp; 318.878220: dma_buf_detach: exp_name=3Dqcom,system size=3D127=
71328 ino=3D2762 attachment:ffffff880a18dd00 is_dynamic=3D0 dev_name=3Dkgsl=
-3d0<br>
&gt;<br>
&gt; Signed-off-by: Xiang Gao &lt;gaoxiang17@xiaomi.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/dma-buf/dma-buf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
42 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp; include/trace/events/dma_buf.h | 157 &#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 2 files changed, 198 insertions(&#43;), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 include/trace/events/dma_buf.h<br>
&gt;<br>
&gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c<br>
&gt; index 2bcf9ceca997..ce39bc19e13f 100644<br>
&gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; &#43;&#43;&#43; b/drivers/dma-buf/dma-buf.c<br>
&gt; @@ -35,6 &#43;35,25 @@<br>
&gt;<br>
&gt;&nbsp; #include &quot;dma-buf-sysfs-stats.h&quot;<br>
&gt;<br>
&gt; &#43;#define CREATE_TRACE_POINTS<br>
&gt; &#43;#include &lt;trace/events/dma_buf.h&gt;<br>
&gt; &#43;<br>
&gt; &#43;/*<br>
&gt; &#43; * dmabuf-&gt;name must be accessed with holding dmabuf-&gt;name_=
lock.<br>
&gt; &#43; * we need to take the lock around the tracepoint call itself whe=
re<br>
&gt; &#43; * it is called in the code.<br>
&gt; &#43; *<br>
&gt; &#43; * Note: FUNC##_enabled() is a static branch that will only<br>
&gt; &#43; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; be set when the trace even=
t is enabled.<br>
&gt; &#43; */<br>
<br>
Much better.<br>
<br>
&gt; &#43;#define DMA_BUF_TRACE(FUNC, ...)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; do {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (FUNC##_enabled()) {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guard(spinlock)(&am=
p;dmabuf-&gt;name_lock);&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FUNC(__VA_ARGS__);&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 \<br>
<br>
Hmm, I wonder if we should also add:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; } else if (IS_ENABLED(CONFIG_LOCKDEP)) { \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Expose t=
his lock when lockdep is enabled */ \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guard(spinl=
ock)(&amp;dmabuf-&gt;name_lock);&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
<br>
This way, if there is any issue taking the lock, lockdep will flag it<br>
without having to enable the tracepoint.<br>
<br>
When LOCKDEP is not configured, the compiler should remove that block.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } while (0)<br>
&gt; &#43;<br>
&gt;&nbsp; static inline int is_dma_buf_file(struct file *);<br>
&gt;<br>
&gt;<br>
<br>
<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/include/trace/events/dma_buf.h<br>
&gt; @@ -0,0 &#43;1,157 @@<br>
&gt; &#43;/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; &#43;#undef TRACE_SYSTEM<br>
&gt; &#43;#define TRACE_SYSTEM dma_buf<br>
&gt; &#43;<br>
&gt; &#43;#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ=
)<br>
&gt; &#43;#define _TRACE_DMA_BUF_H<br>
&gt; &#43;<br>
&gt; &#43;#include &lt;linux/dma-buf.h&gt;<br>
&gt; &#43;#include &lt;linux/tracepoint.h&gt;<br>
&gt; &#43;<br>
&gt; &#43;DECLARE_EVENT_CLASS(dma_buf,<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; TP_PROTO(struct dma_buf *dmabuf),<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; TP_ARGS(dmabuf),<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; TP_STRUCT__entry(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; __string(exp_name, dmabuf-&gt;exp_name)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; __field(size_t, size)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; __field(ino_t, ino)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ),<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; TP_fast_assign(<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; __assign_str(exp_name);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; __entry-&gt;size =3D dmabuf-&gt;size;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; __entry-&gt;ino =3D dmabuf-&gt;file-&gt;f_inode-&gt;i_ino;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ),<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; TP_printk(&quot;exp_name=3D%s size=3D%zu=
 ino=3D%lu&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; __get_str(exp_name),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; __entry-&gt;size,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; __entry-&gt;ino)<br>
&gt; &#43;);<br>
<br>
For the rest of the patch, from a tracing point of view:<br>
<br>
Reviewed-by: Steven Rostedt (Google) &lt;rostedt@goodmis.org&gt;<br>
<br>
-- Steve<br>
</div>
</span></font>
</body>
</html>

--_000_f48da27cfb3f4052958c97d2eb7244b3xiaomicom_--
