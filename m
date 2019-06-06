Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6775636A87
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 05:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12EC89780;
	Thu,  6 Jun 2019 03:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A79E689780
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 03:47:18 +0000 (UTC)
X-UUID: 2f48e69f3fb44eaab5e6ac3909e08df2-20190606
X-UUID: 2f48e69f3fb44eaab5e6ac3909e08df2-20190606
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 537222429; Thu, 06 Jun 2019 11:47:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 6 Jun 2019 11:47:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 6 Jun 2019 11:47:12 +0800
Message-ID: <1559792829.20098.4.camel@mtksdaap41>
Subject: Re: [PATCH v3, 01/27] dt-bindings: mediatek: add binding for mt8183
 display
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Thu, 6 Jun 2019 11:47:09 +0800
In-Reply-To: <1559734986-7379-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-2-git-send-email-yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFdlZCwgMjAxOS0wNi0wNSBhdCAxOTo0MiArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9j
dW1lbnRpb24gZm9yIHRoZSBkaXNwbGF5IHN1YnN5c3RlbSBmb3IKPiBNZWRpYXRlayBNVDgxODMg
U09Dcwo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwLnR4dCAgICB8IDM0ICsrKysrKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggODQ2OWRlNS4uNzA3NzBmZSAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTI3LDIwICsyNywy
MCBAQCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkcGkudHh0Lgo+ICAKPiAgUmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9u
IGJsb2Nrcyk6Cj4gIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kaXNwLTxmdW5jdGlv
bj4iLCBvbmUgb2YKPiAtCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwiICAgLSBvdmVybGF5ICg0
IGxheWVycywgYmxlbmRpbmcsIGNzYykKPiAtCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1yZG1hIiAg
LSByZWFkIERNQSAvIGxpbmUgYnVmZmVyCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3Atd2RtYSIg
IC0gd3JpdGUgRE1BCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtY29sb3IiIC0gY29sb3IgcHJv
Y2Vzc29yCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtYWFsIiAgIC0gYWRhcHRpdmUgYW1iaWVu
dCBsaWdodCBjb250cm9sbGVyCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtZ2FtbWEiIC0gZ2Ft
bWEgY29ycmVjdGlvbgo+IC0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW1lcmdlIiAtIG1lcmdlIHN0
cmVhbXMgZnJvbSB0d28gUkRNQSBzb3VyY2VzCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3Bs
aXQiIC0gc3BsaXQgc3RyZWFtIHRvIHR3byBlbmNvZGVycwo+IC0JIm1lZGlhdGVrLDxjaGlwPi1k
aXNwLXVmb2UiICAtIGRhdGEgY29tcHJlc3Npb24gZW5naW5lCj4gLQkibWVkaWF0ZWssPGNoaXA+
LWRzaSIgICAgICAgIC0gRFNJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkc2kudHh0Cj4gLQki
bWVkaWF0ZWssPGNoaXA+LWRwaSIgICAgICAgIC0gRFBJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRl
ayxkcGkudHh0Cj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtbXV0ZXgiIC0gZGlzcGxheSBtdXRl
eAo+IC0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAgICAtIG92ZXJkcml2ZQo+IC0gIHRoZSBz
dXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQyNzEyIGFuZCBtdDgxNzMuCj4gKwkibWVkaWF0
ZWssPGNoaXA+LWRpc3Atb3ZsIiAgIAkJLSBvdmVybGF5ICg0IGxheWVycywgYmxlbmRpbmcsIGNz
YykKPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1yZG1hIiAgCQktIHJlYWQgRE1BIC8gbGluZSBi
dWZmZXIKPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIiAgCQktIHdyaXRlIERNQQo+ICsJ
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLWNvbG9yIiAJCS0gY29sb3IgcHJvY2Vzc29yCj4gKwkibWVk
aWF0ZWssPGNoaXA+LWRpc3AtYWFsIiAgIAkJLSBhZGFwdGl2ZSBhbWJpZW50IGxpZ2h0IGNvbnRy
b2xsZXIKPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1nYW1tYSIgCQktIGdhbW1hIGNvcnJlY3Rp
b24KPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tZXJnZSIgCQktIG1lcmdlIHN0cmVhbXMgZnJv
bSB0d28gUkRNQSBzb3VyY2VzCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiIAkJLSBz
cGxpdCBzdHJlYW0gdG8gdHdvIGVuY29kZXJzCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZv
ZSIgIAkJLSBkYXRhIGNvbXByZXNzaW9uIGVuZ2luZQo+ICsJIm1lZGlhdGVrLDxjaGlwPi1kc2ki
ICAgICAgICAJCS0gRFNJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkc2kudHh0Cj4gKwkibWVk
aWF0ZWssPGNoaXA+LWRwaSIgICAgICAgIAkJLSBEUEkgY29udHJvbGxlciwgc2VlIG1lZGlhdGVr
LGRwaS50eHQKPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRleCIgCQktIGRpc3BsYXkgbXV0
ZXgKPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vZCIgICAgCQktIG92ZXJkcml2ZQoKSSB0aGlu
ayB5b3UgYWRkICd0YWInIGJlY2F1c2Ugb2YgImFkZCBvdmxfMmwgZGVzY3JpcHRpb24gZm9yIG10
ODE4MwpkaXNwbGF5IiBub3QgImFkZCBiaW5kaW5nIGZvciBtdDgxODMgZGlzcGxheSIsIHNvIG1v
dmUgdGhlICd0YWInIHRvIHRoZQpyZWxhdGVkIHBhdGNoLgoKPiArICB0aGUgc3VwcG9ydGVkIGNo
aXBzIGFyZSBtdDI3MDEsIG10MjcxMiwgbXQ4MTczIGFuZCBtdDgxODMuCj4gIC0gcmVnOiBQaHlz
aWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0
ZXIgc3BhY2UKPiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBm
dW5jdGlvbiBibG9jayAocmVxdWlyZWQsIGV4Y2VwdCBmb3IKPiAgICBtZXJnZSBhbmQgc3BsaXQg
ZnVuY3Rpb24gYmxvY2tzKS4KPiBAQCAtNzEsNiArNzEsMTIgQEAgbW1zeXM6IGNsb2NrLWNvbnRy
b2xsZXJAMTQwMDAwMDAgewo+ICAJI2Nsb2NrLWNlbGxzID0gPDE+Owo+ICB9Owo+ICAKPiArZGlz
cGxheV9jb21wb25lbnRzOiBkaXNwc3lzQDE0MDAwMDAwIHsKPiArCQljb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE4My1kaXNwbGF5IjsKCldoZXJlIGRvIHlvdSBkZWZpbmUgIm1lZGlhdGVrLG10
ODE4My1kaXNwbGF5Ij8KClJlZ2FyZHMsCkNLCgo+ICsJCXJlZyA9IDwwIDB4MTQwMDAwMDAgMCAw
eDEwMDA+Owo+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgxODNfUE9XRVJfRE9NQUlO
X0RJU1A+Owo+ICt9Owo+ICsKPiAgb3ZsMDogb3ZsQDE0MDBjMDAwIHsKPiAgCWNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTczLWRpc3Atb3ZsIjsKPiAgCXJlZyA9IDwwIDB4MTQwMGMwMDAgMCAw
eDEwMDA+OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
