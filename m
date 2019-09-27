Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58200BFCB9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 03:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24026EE3A;
	Fri, 27 Sep 2019 01:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id BDDD76EE3A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 01:34:08 +0000 (UTC)
X-UUID: d75ceb94d1aa46a596bd3f204899d1b0-20190927
X-UUID: d75ceb94d1aa46a596bd3f204899d1b0-20190927
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1295993903; Fri, 27 Sep 2019 09:34:03 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Sep 2019 09:34:02 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Sep 2019 09:34:02 +0800
Message-ID: <1569548042.24127.6.camel@mtksdaap41>
Subject: Re: [PATCH v7 1/5] dt-bindings: display: mediatek: update dsi
 supported chips
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Fri, 27 Sep 2019 09:34:02 +0800
In-Reply-To: <1569216981.20872.3.camel@mtksdaap41>
References: <20190920090432.3308-1-jitao.shi@mediatek.com>
 <20190920090432.3308-2-jitao.shi@mediatek.com>
 <1569216981.20872.3.camel@mtksdaap41>
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

SGksIEppdGFvOgoKT24gTW9uLCAyMDE5LTA5LTIzIGF0IDEzOjM2ICswODAwLCBDSyBIdSB3cm90
ZToKPiBIaSwgSml0YW86Cj4gCj4gT24gRnJpLCAyMDE5LTA5LTIwIGF0IDE3OjA0ICswODAwLCBK
aXRhbyBTaGkgd3JvdGU6Cj4gPiBVcGRhdGUgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGF0
aW9uIGZvciB0aGUgZHNpIGZvcgo+ID4gTWVkaWF0ZWsgTVQ4MTgzIFNvQ3MuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiA+IEFja2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IAo+IFRoaXMgdmVyc2lvbiBpcyBk
aWZmZXJlbnQgd2l0aCBwcmV2aW91cyB2ZXJzaW9uIFsxXSwgc28gSSB0aGluayB5b3UKPiBzaG91
bGQgZHJvcCB0aGUgJ0Fja2VkLWJ5JyB0YWcuCj4gCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTEwODE3MDEvCj4gCj4gUmVnYXJkcywKPiBDSwo+IAo+ID4gLS0tCj4g
PiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCAgICB8IDE1
ICsrKysrKysrKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50
eHQKPiA+IGluZGV4IGZhZGYzMjdjN2NkZi4uOTkzZmYwNzlhYzA5IDEwMDY0NAo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssZHNpLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dAo+ID4gQEAgLTcsNyArNyw3IEBAIGNoYW5u
ZWwgb3V0cHV0Lgo+ID4gIAo+ID4gIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgLSBjb21wYXRp
YmxlOiAibWVkaWF0ZWssPGNoaXA+LWRzaSIKPiA+IC0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJl
IG10MjcwMSBhbmQgbXQ4MTczLgo+ID4gKyAgdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAx
LCBtdDgxNzMgYW5kIG10ODE4My4KPiA+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFu
ZCBsZW5ndGggb2YgdGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiA+ICAtIGludGVycnVwdHM6
IFRoZSBpbnRlcnJ1cHQgc2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrLgo+ID4gIC0gY2xv
Y2tzOiBkZXZpY2UgY2xvY2tzCj4gPiBAQCAtMjYsMjIgKzI2LDMxIEBAIFRoZSBNSVBJIFRYIGNv
bmZpZ3VyYXRpb24gbW9kdWxlIGNvbnRyb2xzIHRoZSBNSVBJIEQtUEhZLgo+ID4gIAo+ID4gIFJl
cXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgLSBjb21wYXRpYmxlOiAibWVkaWF0ZWssPGNoaXA+LW1p
cGktdHgiCj4gPiAtICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEgYW5kIG10ODE3My4K
PiA+ICsgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ4MTczIGFuZCBtdDgxODMu
Cj4gPiAgLSByZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250
cm9sbGVyJ3MgcmVnaXN0ZXJzCj4gPiAgLSBjbG9ja3M6IFBMTCByZWZlcmVuY2UgY2xvY2sKPiA+
ICAtIGNsb2NrLW91dHB1dC1uYW1lczogbmFtZSBvZiB0aGUgb3V0cHV0IGNsb2NrIGxpbmUgdG8g
dGhlIERTSSBlbmNvZGVyCj4gPiAgLSAjY2xvY2stY2VsbHM6IG11c3QgYmUgPDA+Owo+ID4gIC0g
I3BoeS1jZWxsczogbXVzdCBiZSA8MD4uCj4gPiAgCj4gPiArT3B0aW9uYWwgcHJvcGVydGllczoK
PiA+ICstIG52bWVtLWNlbGxzOiBBIHBoYW5kbGUgdG8gdGhlIGNhbGlicmF0aW9uIGRhdGEgcHJv
dmlkZWQgYnkgYSBudm1lbSBkZXZpY2UuIElmCj4gPiArICAgICAgICAgICAgICAgdW5zcGVjaWZp
ZWQgZGVmYXVsdCB2YWx1ZXMgc2hhbGwgYmUgdXNlZC4KPiA+ICstIG52bWVtLWNlbGwtbmFtZXM6
IFNob3VsZCBiZSAiY2FsaWJyYXRpb24tZGF0YSIKPiA+ICstIG1pcGl0eC1jdXJyZW50LWRyaXZl
OiBhZGp1c3QgZHJpdmluZyBjdXJyZW50LCBzaG91bGQgYmUgMSB+IDB4Rgo+ID4gKwoKWW91IGFk
ZCBvcHRpb25hbCBwcm9wZXJ0aWVzIGluIHRoaXMgdmVyc2lvbi4gSSB3b3VsZCBsaWtlIHlvdSB0
bwpzZXBhcmF0ZSB0aGlzIHBhcnQgdG8gYW5vdGhlciBwYXRjaC4gVGhpcyBwYXJ0IGxvb2tzIG5v
dCBzdHJvbmcgcmVsYXRlZAp0byBtdDgxODMgKHRoZXNlIHByb3BlcnRpZXMgbWF5IGFsc28gYXBw
bGllZCB0byBvdGhlciBTb0MpLiBTbyBJJ3ZlCmFwcGxpZWQgcHJldmlvdXMgdmVyc2lvbiBpbiBt
ZWRpYXRlay1kcm0tbmV4dC01LjUgWzFdLCBhbmQgSSd2ZSBhbHNvCmFwcGxpZWQgdGhlc2Ugc2Vy
aWVzIChleGNlcHQgcGF0Y2hlcyByZWxhdGVkIHRvIHRoZXNlIHByb3BlcnR5KSwgc28gSQp3b3Vs
ZCBsaWtlIHlvdSB0byBzZW5kIGFub3RoZXIgc2VyaWVzIGZvciB0aGVzZSBwcm9wZXJ0aWVzLgoK
WzFdCmh0dHBzOi8vZ2l0aHViLmNvbS9ja2h1LW1lZGlhdGVrL2xpbnV4LmdpdC10YWdzL2NvbW1p
dHMvbWVkaWF0ZWstZHJtLW5leHQtNS41CgpSZWdhcmRzLApDSwoKPiA+ICBFeGFtcGxlOgo+ID4g
IAo+ID4gIG1pcGlfdHgwOiBtaXBpLWRwaHlAMTAyMTUwMDAgewo+ID4gIAljb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE3My1taXBpLXR4IjsKPiA+ICAJcmVnID0gPDAgMHgxMDIxNTAwMCAwIDB4
MTAwMD47Cj4gPiAgCWNsb2NrcyA9IDwmY2xrMjZtPjsKPiA+IC0JY2xvY2stb3V0cHV0LW5hbWVz
ID0gIm1pcGlfdHgwX3BsbCI7Cj4gPiAgCSNjbG9jay1jZWxscyA9IDwwPjsKPiA+ICAJI3BoeS1j
ZWxscyA9IDwwPjsKPiA+ICsJY2xvY2stb3V0cHV0LW5hbWVzID0gIm1pcGlfdHgwX3BsbCI7Cj4g
PiArCW52bWVtLWNlbGxzPSA8Jm1pcGlfdHhfY2FsaWJyYXRpb24+Owo+ID4gKwludm1lbS1jZWxs
LW5hbWVzID0gImNhbGlicmF0aW9uLWRhdGEiOwo+ID4gKwltaXBpdHgtY3VycmVudC1kcml2ZSA9
IDwweDg+Owo+ID4gIH07Cj4gPiAgCj4gPiAgZHNpMDogZHNpQDE0MDFiMDAwIHsKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
