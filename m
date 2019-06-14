Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C145321
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 05:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9005892DE;
	Fri, 14 Jun 2019 03:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BB46892DE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:54:34 +0000 (UTC)
X-UUID: c23474d189164252bd8c02aedc45fa34-20190614
X-UUID: c23474d189164252bd8c02aedc45fa34-20190614
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 708158386; Fri, 14 Jun 2019 11:54:32 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Jun 2019 11:54:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Jun 2019 11:54:30 +0800
Message-ID: <1560484470.16718.13.camel@mtksdaap41>
Subject: Re: [PATCH v3, 14/27] drm/mediatek: add commponent OVL_2L0
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 14 Jun 2019 11:54:30 +0800
In-Reply-To: <1559734986-7379-15-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-15-git-send-email-yongqiang.niu@mediatek.com>
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29tbXBvbmVudCBPVkxf
MkwwCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KCj4gCj4gU2lnbmVk
LW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAyICsrCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAyICsrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggMzEwYzBiOS4uODA5NDkyNiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0yMjcs
NiArMjI3LDcgQEAgc3RhdGljIHZvaWQgbXRrX2dhbW1hX3NldChzdHJ1Y3QgbXRrX2RkcF9jb21w
ICpjb21wLAo+ICAKPiAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBtdGtfZGRwX2NvbXBfc3Rl
bVtNVEtfRERQX0NPTVBfVFlQRV9NQVhdID0gewo+ICAJW01US19ESVNQX09WTF0gPSAib3ZsIiwK
PiArCVtNVEtfRElTUF9PVkxfMkxdID0gIm92bF8ybCIsCj4gIAlbTVRLX0RJU1BfUkRNQV0gPSAi
cmRtYSIsCj4gIAlbTVRLX0RJU1BfV0RNQV0gPSAid2RtYSIsCj4gIAlbTVRLX0RJU1BfQ09MT1Jd
ID0gImNvbG9yIiwKPiBAQCAtMjY2LDYgKzI2Nyw3IEBAIHN0cnVjdCBtdGtfZGRwX2NvbXBfbWF0
Y2ggewo+ICAJW0REUF9DT01QT05FTlRfT0QxXQk9IHsgTVRLX0RJU1BfT0QsCTEsICZkZHBfb2Qg
fSwKPiAgCVtERFBfQ09NUE9ORU5UX09WTDBdCT0geyBNVEtfRElTUF9PVkwsCTAsIE5VTEwgfSwK
PiAgCVtERFBfQ09NUE9ORU5UX09WTDFdCT0geyBNVEtfRElTUF9PVkwsCTEsIE5VTEwgfSwKPiAr
CVtERFBfQ09NUE9ORU5UX09WTF8yTDBdCT0geyBNVEtfRElTUF9PVkxfMkwsCTAsIE5VTEwgfSwK
PiAgCVtERFBfQ09NUE9ORU5UX1BXTTBdCT0geyBNVEtfRElTUF9QV00sCTAsIE5VTEwgfSwKPiAg
CVtERFBfQ09NUE9ORU5UX1BXTTFdCT0geyBNVEtfRElTUF9QV00sCTEsIE5VTEwgfSwKPiAgCVtE
RFBfQ09NUE9ORU5UX1BXTTJdCT0geyBNVEtfRElTUF9QV00sCTIsIE5VTEwgfSwKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiBpbmRleCA4N2VmMjkwLi5h
ODFjMzIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5oCj4gQEAgLTI1LDYgKzI1LDcgQEAKPiAgCj4gIGVudW0gbXRrX2RkcF9jb21wX3R5cGUgewo+
ICAJTVRLX0RJU1BfT1ZMLAo+ICsJTVRLX0RJU1BfT1ZMXzJMLAo+ICAJTVRLX0RJU1BfUkRNQSwK
PiAgCU1US19ESVNQX1dETUEsCj4gIAlNVEtfRElTUF9DT0xPUiwKPiBAQCAtNTgsNiArNTksNyBA
QCBlbnVtIG10a19kZHBfY29tcF9pZCB7Cj4gIAlERFBfQ09NUE9ORU5UX09EMCwKPiAgCUREUF9D
T01QT05FTlRfT0QxLAo+ICAJRERQX0NPTVBPTkVOVF9PVkwwLAo+ICsJRERQX0NPTVBPTkVOVF9P
VkxfMkwwLAo+ICAJRERQX0NPTVBPTkVOVF9PVkwxLAo+ICAJRERQX0NPTVBPTkVOVF9QV00wLAo+
ICAJRERQX0NPTVBPTkVOVF9QV00xLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
