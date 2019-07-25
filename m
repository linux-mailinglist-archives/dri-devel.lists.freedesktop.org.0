Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C94743DC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 05:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4B86E3A2;
	Thu, 25 Jul 2019 03:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C32996E3A2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 03:20:28 +0000 (UTC)
X-UUID: ed85f5d1925b4024b7446fdc12bebcaf-20190725
X-UUID: ed85f5d1925b4024b7446fdc12bebcaf-20190725
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 461284809; Thu, 25 Jul 2019 11:20:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 25 Jul 2019 11:20:19 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 25 Jul 2019 11:20:19 +0800
Message-ID: <1564024819.2621.4.camel@mtksdaap41>
Subject: Re: [PATCH v4, 05/33] dt-bindings: mediatek: add RDMA1 description
 for mt8183 display
From: CK Hu <ck.hu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 25 Jul 2019 11:20:19 +0800
In-Reply-To: <20190724201635.GA18345@bogus>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-6-git-send-email-yongqiang.niu@mediatek.com>
 <20190724201635.GA18345@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D8A1CCF38AD247D3F162A72E891F36A49E6C52CAB3DEA3F413B16EB119711E62000:8
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
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFJvYjoKCk9uIFdlZCwgMjAxOS0wNy0yNCBhdCAxNDoxNiAtMDYwMCwgUm9iIEhlcnJpbmcg
d3JvdGU6Cj4gT24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDY6MzM6NDVBTSArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gPiBGcm9tOiBZb25ncWlhbmcgTml1IDx5b25n
cWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiA+IAo+ID4gVGhpcyBwYXRjaCBhZGQgUkRNQTEgZGVz
Y3JpcHRpb24gZm9yIG10ODE4MyBkaXNwbGF5Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdx
aWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiA+IGluZGV4IGFmZDNjOTAu
LmJiOTI3NGEgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50
eHQKPiA+IEBAIC0zMCw2ICszMCw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlv
biBibG9ja3MpOgo+ID4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3Atb3ZsIiAgIAkJLSBvdmVybGF5
ICg0IGxheWVycywgYmxlbmRpbmcsIGNzYykKPiA+ICAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW92
bC0ybCIgICAgICAgICAgIC0gb3ZlcmxheSAoMiBsYXllcnMsIGJsZW5kaW5nLCBjc2MpCj4gPiAg
CSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1yZG1hIiAgCQktIHJlYWQgRE1BIC8gbGluZSBidWZmZXIK
PiA+ICsJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXJkbWExIiAgICAgICAgICAgIC0gZnVuY3Rpb24g
aXMgc2FtZSB3aXRoIFJETUEsIGZpZm8gc2l6ZSBpcyBkaWZmZXJlbnQKPiAKPiBUaGlzIGNhbid0
IGJlIGRldGVybWluZWQgYnkgd2hpY2ggY2hpcCBpdCBpcz8gSU9XLCBhIGNoaXAgbWF5IGhhdmUg
Ym90aCAKPiByZG1hIGFuZCByZG1hMT8KCkluIE1UODE4MywgdGhlcmUgYXJlIHR3byBkaWZmZXJl
bnQgcmRtYS4gVGhlIGRpZmZlcmVuY2UgaXMgdGhlIGZpZm8gc2l6ZQppbiBlYWNoIG9uZS4gSSd2
ZSBhIHF1ZXN0aW9uOiBpcyBpdCBiZXR0ZXIgdG8gaGF2ZSB0d28gY29tcGF0aWJsZSBzdHJpbmcK
Zm9yIGVhY2ggb25lLCBvciBqdXN0IG9uZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgYm90aCBidXQg
d2l0aCBhIHByb3BlcnR5CnRvIHNldCBmaWZvIHNpemU/CgpSZWdhcmRzLApDSwoKPiAKPiA+ICAJ
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLXdkbWEiICAJCS0gd3JpdGUgRE1BCj4gPiAgCSJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1jY29yciIgICAgICAgICAgICAtIGNvbG9yIGNvcnJlY3Rpb24KPiA+ICAJ
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLWNvbG9yIiAJCS0gY29sb3IgcHJvY2Vzc29yCj4gPiAtLSAK
PiA+IDEuOC4xLjEuZGlydHkKPiA+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
