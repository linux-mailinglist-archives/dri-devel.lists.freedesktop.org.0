Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD4ABAD7D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 07:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2146E0C6;
	Mon, 23 Sep 2019 05:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 545986E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 05:36:28 +0000 (UTC)
X-UUID: 401fd445ccf74d7aa1d69a70a68e4755-20190923
X-UUID: 401fd445ccf74d7aa1d69a70a68e4755-20190923
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1952210247; Mon, 23 Sep 2019 13:36:23 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Sep 2019 13:36:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 23 Sep 2019 13:36:20 +0800
Message-ID: <1569216981.20872.3.camel@mtksdaap41>
Subject: Re: [PATCH v7 1/5] dt-bindings: display: mediatek: update dsi
 supported chips
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 23 Sep 2019 13:36:21 +0800
In-Reply-To: <20190920090432.3308-2-jitao.shi@mediatek.com>
References: <20190920090432.3308-1-jitao.shi@mediatek.com>
 <20190920090432.3308-2-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gRnJpLCAyMDE5LTA5LTIwIGF0IDE3OjA0ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gVXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhl
IGRzaSBmb3IKPiBNZWRpYXRlayBNVDgxODMgU29Dcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaXRh
byBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+CgpUaGlzIHZlcnNpb24gaXMgZGlmZmVyZW50IHdpdGggcHJldmlvdXMg
dmVyc2lvbiBbMV0sIHNvIEkgdGhpbmsgeW91CnNob3VsZCBkcm9wIHRoZSAnQWNrZWQtYnknIHRh
Zy4KClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMDgxNzAxLwoKUmVn
YXJkcywKQ0sKCj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRzaS50eHQgICAgfCAxNSArKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkc2kudHh0Cj4gaW5kZXggZmFkZjMyN2M3Y2RmLi45OTNmZjA3OWFjMDkgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZHNpLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiBAQCAtNyw3ICs3LDcgQEAgY2hh
bm5lbCBvdXRwdXQuCj4gIAo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIGNvbXBhdGlibGU6
ICJtZWRpYXRlayw8Y2hpcD4tZHNpIgo+IC0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10Mjcw
MSBhbmQgbXQ4MTczLgo+ICsgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ4MTcz
IGFuZCBtdDgxODMuCj4gIC0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBv
ZiB0aGUgY29udHJvbGxlcidzIHJlZ2lzdGVycwo+ICAtIGludGVycnVwdHM6IFRoZSBpbnRlcnJ1
cHQgc2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrLgo+ICAtIGNsb2NrczogZGV2aWNlIGNs
b2Nrcwo+IEBAIC0yNiwyMiArMjYsMzEgQEAgVGhlIE1JUEkgVFggY29uZmlndXJhdGlvbiBtb2R1
bGUgY29udHJvbHMgdGhlIE1JUEkgRC1QSFkuCj4gIAo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+
ICAtIGNvbXBhdGlibGU6ICJtZWRpYXRlayw8Y2hpcD4tbWlwaS10eCIKPiAtICB0aGUgc3VwcG9y
dGVkIGNoaXBzIGFyZSBtdDI3MDEgYW5kIG10ODE3My4KPiArICB0aGUgc3VwcG9ydGVkIGNoaXBz
IGFyZSBtdDI3MDEsIG10ODE3MyBhbmQgbXQ4MTgzLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBh
ZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiAgLSBjbG9j
a3M6IFBMTCByZWZlcmVuY2UgY2xvY2sKPiAgLSBjbG9jay1vdXRwdXQtbmFtZXM6IG5hbWUgb2Yg
dGhlIG91dHB1dCBjbG9jayBsaW5lIHRvIHRoZSBEU0kgZW5jb2Rlcgo+ICAtICNjbG9jay1jZWxs
czogbXVzdCBiZSA8MD47Cj4gIC0gI3BoeS1jZWxsczogbXVzdCBiZSA8MD4uCj4gIAo+ICtPcHRp
b25hbCBwcm9wZXJ0aWVzOgo+ICstIG52bWVtLWNlbGxzOiBBIHBoYW5kbGUgdG8gdGhlIGNhbGli
cmF0aW9uIGRhdGEgcHJvdmlkZWQgYnkgYSBudm1lbSBkZXZpY2UuIElmCj4gKyAgICAgICAgICAg
ICAgIHVuc3BlY2lmaWVkIGRlZmF1bHQgdmFsdWVzIHNoYWxsIGJlIHVzZWQuCj4gKy0gbnZtZW0t
Y2VsbC1uYW1lczogU2hvdWxkIGJlICJjYWxpYnJhdGlvbi1kYXRhIgo+ICstIG1pcGl0eC1jdXJy
ZW50LWRyaXZlOiBhZGp1c3QgZHJpdmluZyBjdXJyZW50LCBzaG91bGQgYmUgMSB+IDB4Rgo+ICsK
PiAgRXhhbXBsZToKPiAgCj4gIG1pcGlfdHgwOiBtaXBpLWRwaHlAMTAyMTUwMDAgewo+ICAJY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtbWlwaS10eCI7Cj4gIAlyZWcgPSA8MCAweDEwMjE1
MDAwIDAgMHgxMDAwPjsKPiAgCWNsb2NrcyA9IDwmY2xrMjZtPjsKPiAtCWNsb2NrLW91dHB1dC1u
YW1lcyA9ICJtaXBpX3R4MF9wbGwiOwo+ICAJI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICAJI3BoeS1j
ZWxscyA9IDwwPjsKPiArCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJtaXBpX3R4MF9wbGwiOwo+ICsJ
bnZtZW0tY2VsbHM9IDwmbWlwaV90eF9jYWxpYnJhdGlvbj47Cj4gKwludm1lbS1jZWxsLW5hbWVz
ID0gImNhbGlicmF0aW9uLWRhdGEiOwo+ICsJbWlwaXR4LWN1cnJlbnQtZHJpdmUgPSA8MHg4PjsK
PiAgfTsKPiAgCj4gIGRzaTA6IGRzaUAxNDAxYjAwMCB7CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
