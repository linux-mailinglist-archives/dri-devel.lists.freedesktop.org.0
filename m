Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569175634F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6F6E2AF;
	Wed, 26 Jun 2019 07:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258CE6E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:26:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BB02B80324;
 Wed, 26 Jun 2019 09:26:29 +0200 (CEST)
Date: Wed, 26 Jun 2019 09:26:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3 4/4] drm/panel: support for auo, kd101n80-45na wuxga dsi
 video mode panel
Message-ID: <20190626072628.GC14541@ravnborg.org>
References: <20190626025400.109567-1-jitao.shi@mediatek.com>
 <20190626025400.109567-5-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626025400.109567-5-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=e5mUnYsNAAAA:8 a=noVse8_2oiOjf6f6wEgA:9 a=CjuIK1q_8ugA:10
 a=6heAxKwa5pAsJatQ0mat:22 a=Vxmtnl_E_bksehYqCbjh:22
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
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, linux-pwm@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTA6NTQ6MDBBTSArMDgwMCwgSml0YW8gU2hpIHdyb3Rl
Ogo+IEF1byxrZDEwMW44MC00NW5hJ3MgY29ubmVjdG9yIGlzIHNhbWUgYXMgYm9lLHR2MTAxd3Vt
LW5sNi4KPiBUaGUgbW9zdCBjb2RlcyBjYW4gYmUgcmV1c2UuCj4gU28gYXVvLGtkMTAxbjgwLTQ1
bmEgYW5kIGJvZSx0djEwMXd1bS1ubDYgdXNlIG9uZSBkcml2ZXIgZmlsZS4KPiBBZGQgdGhlIGRp
ZmZlcmVudCBwYXJ0cyBpbiBkcml2ZXIgZGF0YS4KClZlcnkgbmljZSBjb25zb2xpZGF0aW9uLgpI
YXZlIHlvdSBjb25zaWRlcmVkIGFub3RoZXIgZmlsZW5hbWUgdGhhdCBiZXR0ZXIgdGVsbCB0aGlz
IGlzIGEgZHJpdmVyCmZvciBkaWZmZXJlbnQgdHlwZXMgb2YgZGlzcGxheXM/CgpBbmQgdGhlIEtj
b25maWcgdGV4dCBuZWVkcyBzb21lIGFkanVzdG1lbnQgdG8gdGVsbCB0aGlzIGRyaXZlciBub3cK
c3VwcG9ydHMgYW4gZXh0cmEgdHlwZSBvZiBkaXNwbGF5LgoKCVNhbQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2dwdS9k
cm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jICAgIHwgMzkgKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYwo+IGluZGV4IDMwZDFmNTNk
Y2JhZi4uNmZmNDlmOTAwY2QyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtYm9lLXR2MTAxd3VtLW5sNi5jCj4gQEAgLTM3Miw2ICszNzIsMTUgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBwYW5lbF9pbml0X2NtZCBib2VfaW5pdF9jbWRbXSA9IHsKPiAgCXt9LAo+ICB9Owo+
ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9pbml0X2NtZCBhdW9faW5pdF9jbWRbXSA9
IHsKPiArCV9JTklUX0RFTEFZX0NNRCgyNCksCj4gKwlfSU5JVF9EQ1NfQ01EKDB4MTEpLAo+ICsJ
X0lOSVRfREVMQVlfQ01EKDEyMCksCj4gKwlfSU5JVF9EQ1NfQ01EKDB4MjkpLAo+ICsJX0lOSVRf
REVMQVlfQ01EKDEyMCksCj4gKwl7fSwKPiArfTsKPiArCj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0
IGJvZV9wYW5lbCAqdG9fYm9lX3BhbmVsKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICB7Cj4g
IAlyZXR1cm4gY29udGFpbmVyX29mKHBhbmVsLCBzdHJ1Y3QgYm9lX3BhbmVsLCBiYXNlKTsKPiBA
QCAtNTcxLDYgKzU4MCwzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYm9lX3R2
MTAxd3VtX25sNl9kZXNjID0gewo+ICAJLmluaXRfY21kcyA9IGJvZV9pbml0X2NtZCwKPiAgfTsK
PiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBhdW9fZGVmYXVsdF9t
b2RlID0gewo+ICsJLmNsb2NrID0gMTU3MDAwLAo+ICsJLmhkaXNwbGF5ID0gMTIwMCwKPiArCS5o
c3luY19zdGFydCA9IDEyMDAgKyA4MCwKPiArCS5oc3luY19lbmQgPSAxMjAwICsgODAgKyAyNCwK
PiArCS5odG90YWwgPSAxMjAwICsgODAgKyAyNCArIDM2LAo+ICsJLnZkaXNwbGF5ID0gMTkyMCwK
PiArCS52c3luY19zdGFydCA9IDE5MjAgKyAxNiwKPiArCS52c3luY19lbmQgPSAxOTIwICsgMTYg
KyA0LAo+ICsJLnZ0b3RhbCA9IDE5MjAgKyAxNiArIDQgKyAxNiwKPiArCS52cmVmcmVzaCA9IDYw
LAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19rZDEwMW44
MF80NW5hX2Rlc2MgPSB7Cj4gKwkubW9kZXMgPSAmYXVvX2RlZmF1bHRfbW9kZSwKPiArCS5icGMg
PSA4LAo+ICsJLnNpemUgPSB7Cj4gKwkJLndpZHRoID0gMTM1LAo+ICsJCS5oZWlnaHQgPSAyMTYs
Cj4gKwl9LAo+ICsJLmxhbmVzID0gNCwKPiArCS5mb3JtYXQgPSBNSVBJX0RTSV9GTVRfUkdCODg4
LAo+ICsJLm1vZGVfZmxhZ3MgPSBNSVBJX0RTSV9NT0RFX1ZJREVPIHwgTUlQSV9EU0lfTU9ERV9W
SURFT19TWU5DX1BVTFNFIHwKPiArCQkgICAgICBNSVBJX0RTSV9NT0RFX0xQTSwKPiArCS5pbml0
X2NtZHMgPSBhdW9faW5pdF9jbWQsCj4gK307Cj4gKwo+ICBzdGF0aWMgaW50IGJvZV9wYW5lbF9n
ZXRfbW9kZXMoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCj4gIHsKPiAgCXN0cnVjdCBib2VfcGFu
ZWwgKmJvZSA9IHRvX2JvZV9wYW5lbChwYW5lbCk7Cj4gQEAgLTY5NCw2ICs3MzAsOSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBib2Vfb2ZfbWF0Y2hbXSA9IHsKPiAgCXsgLmNv
bXBhdGlibGUgPSAiYm9lLHR2MTAxd3VtLW5sNiIsCj4gIAkgIC5kYXRhID0gJmJvZV90djEwMXd1
bV9ubDZfZGVzYwo+ICAJfSwKPiArCXsgLmNvbXBhdGlibGUgPSAiYXVvLGtkMTAxbjgwLTQ1bmEi
LAo+ICsJICAuZGF0YSA9ICZhdW9fa2QxMDFuODBfNDVuYV9kZXNjCj4gKwl9LAo+ICAJeyAvKiBz
ZW50aW5lbCAqLyB9Cj4gIH07Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGJvZV9vZl9tYXRj
aCk7Cj4gLS0gCj4gMi4yMS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
