Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFDD890E8
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 11:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B9E6E318;
	Sun, 11 Aug 2019 09:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C0B7B6E30E
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 09:10:22 +0000 (UTC)
X-UUID: 06caa4f05da24577ad382a44a593aa42-20190811
X-UUID: 06caa4f05da24577ad382a44a593aa42-20190811
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 357677779; Sun, 11 Aug 2019 17:10:15 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 11 Aug 2019 17:10:07 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 11 Aug 2019 17:10:06 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: display: panel: Add BOE tv101wum-n16
 panel bindings
Date: Sun, 11 Aug 2019 17:09:58 +0800
Message-ID: <20190811091001.49555-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190811091001.49555-1-jitao.shi@mediatek.com>
References: <20190811091001.49555-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: ED0F539021A774F8F7C0AB4EDE195669EBA78E8BEFAF79893AE53DACD6A79B7C2000:8
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
Cc: stonea168@163.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRvY3VtZW50YXRpb24gZm9yIGJvZSB0djEwMXd1bS1uMTYgcGFuZWwuCgpTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvYm9lLHR2
MTAxd3VtLW5sNi50eHQgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnR4dAoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL2JvZSx0djEwMXd1bS1ubDYudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iZDQ0YWY2MzYzOTAKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3
dW0tbmw2LnR4dApAQCAtMCwwICsxLDM0IEBACitCb2UgQ29ycG9yYXRpb24gMTAuMSIgV1VYR0Eg
VEZUIExDRCBwYW5lbAorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91
bGQgYmUgImJvZSx0djEwMXd1bS1ubDYiCistIHJlZzogdGhlIHZpcnR1YWwgY2hhbm5lbCBudW1i
ZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAorLSBlbmFibGUtZ3Bpb3M6IGEgR1BJTyBzcGVjIGZvciB0
aGUgZW5hYmxlIHBpbgorLSBwcDE4MDAtc3VwcGx5OiBjb3JlIHZvbHRhZ2Ugc3VwcGx5CistIGF2
ZGQtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyBwb3NpdGl2
ZSB2b2x0YWdlCistIGF2ZWUtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBw
cm92aWRlcyBuZWdhdGl2ZSB2b2x0YWdlCistIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUgYmFj
a2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKKworVGhlIGRldmljZSBub2RlIGNh
biBjb250YWluIG9uZSAncG9ydCcgY2hpbGQgbm9kZSB3aXRoIG9uZSBjaGlsZAorJ2VuZHBvaW50
JyBub2RlLCBhY2NvcmRpbmcgdG8gdGhlIGJpbmRpbmdzIGRlZmluZWQgaW4KK21lZGlhL3ZpZGVv
LWludGVyZmFjZXMudHh0LiBUaGlzIG5vZGUgc2hvdWxkIGRlc2NyaWJlIHBhbmVsJ3MgdmlkZW8g
YnVzLgorCitFeGFtcGxlOgorJmRzaSB7CisJLi4uCisJcGFuZWxAMCB7CisJCWNvbXBhdGlibGUg
PSAiYm9lLHR2MTAxd3VtLW5sNiI7CisJCXJlZyA9IDwwPjsKKwkJZW5hYmxlLWdwaW9zID0gPCZw
aW8gNDUgMD47CisJCWF2ZGQtc3VwcGx5ID0gPCZwcHZhcm5fbGNkPjsKKwkJYXZlZS1zdXBwbHkg
PSA8JnBwdmFycF9sY2Q+OworCQlwcDE4MDAtc3VwcGx5ID0gPCZwcDE4MDBfbGNkPjsKKwkJYmFj
a2xpZ2h0ID0gPCZiYWNrbGlnaHRfbGNkMD47CisJCXN0YXR1cyA9ICJva2F5IjsKKwkJcG9ydCB7
CisJCQlwYW5lbF9pbjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX291
dD47CisJCQl9OworCQl9OworCX07Cit9OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
