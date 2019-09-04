Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58700A7822
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 03:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C87E8997E;
	Wed,  4 Sep 2019 01:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E5BA8997E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 01:44:17 +0000 (UTC)
X-UUID: 9601f760e38440418cadeb7ac1cffc09-20190904
X-UUID: 9601f760e38440418cadeb7ac1cffc09-20190904
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1155643741; Wed, 04 Sep 2019 09:44:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Sep 2019 09:44:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Sep 2019 09:44:08 +0800
Message-ID: <1567561448.6949.0.camel@mtksdaap41>
Subject: Re: [PATCH v5, 02/32] dt-bindings: mediatek: add ovl_2l description
 for mt8183 display
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 4 Sep 2019 09:44:08 +0800
In-Reply-To: <1567090254-15566-3-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8264C2D1E11AEA1A4F44BD0DDA0F68C7BD70E9D873AA0FEFE7B33B2BA55FEC962000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9j
dW1lbnRpb24gZm9yIHRoZSBkaXNwbGF5IHN1YnN5c3RlbSBmb3IKPiBNZWRpYXRlayBNVDgxODMg
U09DcwoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dC01LjUgWzFdLCB0aGFua3MuCgpbMV0K
aHR0cHM6Ly9naXRodWIuY29tL2NraHUtbWVkaWF0ZWsvbGludXguZ2l0LXRhZ3MvY29tbWl0cy9t
ZWRpYXRlay1kcm0tbmV4dC01LjUKClJlZ2FyZHMsCkNLCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlv
bmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCAgICB8IDI3ICsrKysrKysrKysrLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggNDY0Yjky
Zi4uOGM0NzAwZiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0
Cj4gQEAgLTI3LDE5ICsyNywyMCBAQCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkudHh0Lgo+ICAKPiAgUmVxdWlyZWQgcHJvcGVy
dGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLTxmdW5jdGlvbj4iLCBvbmUgb2YKPiAtCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1v
dmwiICAgLSBvdmVybGF5ICg0IGxheWVycywgYmxlbmRpbmcsIGNzYykKPiAtCSJtZWRpYXRlayw8
Y2hpcD4tZGlzcC1yZG1hIiAgLSByZWFkIERNQSAvIGxpbmUgYnVmZmVyCj4gLQkibWVkaWF0ZWss
PGNoaXA+LWRpc3Atd2RtYSIgIC0gd3JpdGUgRE1BCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3At
Y29sb3IiIC0gY29sb3IgcHJvY2Vzc29yCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtYWFsIiAg
IC0gYWRhcHRpdmUgYW1iaWVudCBsaWdodCBjb250cm9sbGVyCj4gLQkibWVkaWF0ZWssPGNoaXA+
LWRpc3AtZ2FtbWEiIC0gZ2FtbWEgY29ycmVjdGlvbgo+IC0JIm1lZGlhdGVrLDxjaGlwPi1kaXNw
LW1lcmdlIiAtIG1lcmdlIHN0cmVhbXMgZnJvbSB0d28gUkRNQSBzb3VyY2VzCj4gLQkibWVkaWF0
ZWssPGNoaXA+LWRpc3Atc3BsaXQiIC0gc3BsaXQgc3RyZWFtIHRvIHR3byBlbmNvZGVycwo+IC0J
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLXVmb2UiICAtIGRhdGEgY29tcHJlc3Npb24gZW5naW5lCj4g
LQkibWVkaWF0ZWssPGNoaXA+LWRzaSIgICAgICAgIC0gRFNJIGNvbnRyb2xsZXIsIHNlZSBtZWRp
YXRlayxkc2kudHh0Cj4gLQkibWVkaWF0ZWssPGNoaXA+LWRwaSIgICAgICAgIC0gRFBJIGNvbnRy
b2xsZXIsIHNlZSBtZWRpYXRlayxkcGkudHh0Cj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtbXV0
ZXgiIC0gZGlzcGxheSBtdXRleAo+IC0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAgICAtIG92
ZXJkcml2ZQo+ICsJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW92bCIgICAJCS0gb3ZlcmxheSAoNCBs
YXllcnMsIGJsZW5kaW5nLCBjc2MpCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atb3ZsLTJsIiAg
ICAgICAgICAgLSBvdmVybGF5ICgyIGxheWVycywgYmxlbmRpbmcsIGNzYykKPiArCSJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1yZG1hIiAgCQktIHJlYWQgRE1BIC8gbGluZSBidWZmZXIKPiArCSJtZWRp
YXRlayw8Y2hpcD4tZGlzcC13ZG1hIiAgCQktIHdyaXRlIERNQQo+ICsJIm1lZGlhdGVrLDxjaGlw
Pi1kaXNwLWNvbG9yIiAJCS0gY29sb3IgcHJvY2Vzc29yCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRp
c3AtYWFsIiAgIAkJLSBhZGFwdGl2ZSBhbWJpZW50IGxpZ2h0IGNvbnRyb2xsZXIKPiArCSJtZWRp
YXRlayw8Y2hpcD4tZGlzcC1nYW1tYSIgCQktIGdhbW1hIGNvcnJlY3Rpb24KPiArCSJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1tZXJnZSIgCQktIG1lcmdlIHN0cmVhbXMgZnJvbSB0d28gUkRNQSBzb3Vy
Y2VzCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiIAkJLSBzcGxpdCBzdHJlYW0gdG8g
dHdvIGVuY29kZXJzCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIgIAkJLSBkYXRhIGNv
bXByZXNzaW9uIGVuZ2luZQo+ICsJIm1lZGlhdGVrLDxjaGlwPi1kc2kiICAgICAgICAJCS0gRFNJ
IGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkc2kudHh0Cj4gKwkibWVkaWF0ZWssPGNoaXA+LWRw
aSIgICAgICAgIAkJLSBEUEkgY29udHJvbGxlciwgc2VlIG1lZGlhdGVrLGRwaS50eHQKPiArCSJt
ZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRleCIgCQktIGRpc3BsYXkgbXV0ZXgKPiArCSJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1vZCIgICAgCQktIG92ZXJkcml2ZQo+ICAgIHRoZSBzdXBwb3J0ZWQgY2hp
cHMgYXJlIG10MjcwMSwgbXQyNzEyIGFuZCBtdDgxNzMuCj4gIC0gcmVnOiBQaHlzaWNhbCBiYXNl
IGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3BhY2UK
PiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBi
bG9jayAocmVxdWlyZWQsIGV4Y2VwdCBmb3IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
