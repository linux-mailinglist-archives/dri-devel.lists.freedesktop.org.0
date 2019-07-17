Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8753D6B4F9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 05:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946AF89CCE;
	Wed, 17 Jul 2019 03:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5767D89CCE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 03:23:05 +0000 (UTC)
X-UUID: 43c241652bea41cb955581edb6965474-20190717
X-UUID: 43c241652bea41cb955581edb6965474-20190717
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 89910540; Wed, 17 Jul 2019 11:23:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 11:22:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 11:22:58 +0800
Message-ID: <1563333778.29169.5.camel@mtksdaap41>
Subject: Re: [PATCH v4, 01/33] dt-bindings: mediatek: add binding for mt8183
 display
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 11:22:58 +0800
In-Reply-To: <1562625253-29254-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B08C90B4972A6A74DF94ECDCEBA3A927F8F9ECC3D464E9044F2A116F6D54F9162000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozMyArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9j
dW1lbnRpb24gZm9yIHRoZSBkaXNwbGF5IHN1YnN5c3RlbSBmb3IKPiBNZWRpYXRlayBNVDgxODMg
U09Dcwo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwbGF5LnR4dCAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3BsYXkudHh0
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3BsYXkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcGxheS50eHQKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAuLjk1MWQyYTgKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZGlzcGxheS50eHQKPiBAQCAtMCwwICsxLDIxIEBACj4gK01lZGlhdGVrIERp
c3BsYXkgRGV2aWNlCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArCj4gK1RoZSBN
ZWRpYXRlayBEaXNwbGF5IERldmljZSBwcm92aWRlcyBwb3dlciBjb250cm9sIHRvIHRoZSBzeXN0
ZW0uCj4gKwo+ICtSZXF1aXJlZCBQcm9wZXJ0aWVzOgo+ICsKPiArLSBjb21wYXRpYmxlOiBTaG91
bGQgYmUgb25lIG9mOgo+ICsJLSAibWVkaWF0ZWssbXQ4MTgzLWRpc3BsYXkiCgpJIHRoaW5rIHRo
aXMgaXMgIm1lZGlhdGVrLG10ODE4My1tbXN5cyIuIEluIFsxXSwgTWF0dGhpYXMgaGFzIGFncmVl
ZAp0aGF0IHdlIGNvdWxkIGtlZXAgd29yayBvbiBoaXMgcGF0Y2gsIHNvIHlvdSBzaG91bGQgYXBw
bHkgaGlzIHBhdGNoIGFuZApyZW1vdmUgdGhpcyBwYXRjaC4gSW4gWzJdLCBJJ3ZlIGZvdW5kIHRo
YXQgTVQ4MTgzIHNjcHN5cyBoYXMgc29tZQpwcm9ibGVtIHdpdGggTWF0dGhpYXMnIHBhdGNoLCBz
byBwbGVhc2UgYWxzbyBmaXggdGhpcyBwcm9ibGVtLgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTA2ODYzMjcvClsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzExMDA1NzMxLwoKUmVnYXJkcywKQ0sKCj4gKwo+ICtUaGUgRGlzcGxheSBEZXZpY2Ug
cG93ZXIgbmFtZSBhcmUgZGVmaW5lZCBpbgo+ICtpbmNsdWRlXGR0LWJpbmRpbmdzXHBvd2VyXG10
Ki1wb3dlci5oCj4gKwo+ICsKPiArRXhhbXBsZToKPiArCj4gK2Rpc3BsYXlfY29tcG9uZW50czog
ZGlzcHN5c0AxNDAwMDAwMCB7Cj4gKwljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kaXNw
bGF5IjsKPiArCXJlZyA9IDwwIDB4MTQwMDAwMDAgMCAweDEwMDA+Owo+ICsJcG93ZXItZG9tYWlu
cyA9IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9ET01BSU5fRElTUD47Cj4gK307Cj4gXCBObyBuZXds
aW5lIGF0IGVuZCBvZiBmaWxlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
