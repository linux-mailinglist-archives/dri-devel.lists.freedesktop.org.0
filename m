Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62DAB3361
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 04:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC306E0DB;
	Mon, 16 Sep 2019 02:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1AAE46E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 02:30:28 +0000 (UTC)
X-UUID: c42f87e619b04d8396740301e9f6e6a9-20190916
X-UUID: c42f87e619b04d8396740301e9f6e6a9-20190916
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1812552000; Mon, 16 Sep 2019 10:30:03 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Sep 2019 10:29:55 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Sep 2019 10:29:55 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/8] dt-bindings: display: panel: Add BOE tv101wum-n16
 panel bindings
Date: Mon, 16 Sep 2019 10:29:34 +0800
Message-ID: <20190916022941.15404-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916022941.15404-1-jitao.shi@mediatek.com>
References: <20190916022941.15404-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24914.001
X-TM-AS-Result: No-3.890900-8.000000-10
X-TMASE-MatchedRID: icpV8lao858ib7FbSDtRQ+w8wbnnSw8bPz+fM/byAtnfUZT83lbkEEZU
 qiaZ+o8nezYFSWzv4Aj++vFBYLLFFSJrrIAyia6MRORIkLq4xDQ5iooXtStiHoRYHyK7IaoJi9w
 qKeXPJfWPlkcXn2IeyAaIRpZxOPntHRgRCLcbWrgvPGk0keCcJR+qR83NNEVKVptCZRwLvQFKj9
 RzqMBfu9CoiCTf1ntP2SPEr0GBThVv+U6cgdvK9b+Kd/geEyt7fS0Ip2eEHnz3IzXlXlpamPoLR
 4+zsDTtWA7iEVqasYbCFTRnL8b7CbZLgBXF/MOuIu1Mbak02eUOhWkWiQMQJH7kr2QIkk2lb9AY
 +7wXzUwMqpepEwpsT5LY/OI5AKdKa/e94QkRN541URakDnXQmkktfpZ7dIYnT2FJac+dZhxC1db
 lKiPrE8C+ksT6a9fy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.890900-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24914.001
X-TM-SNTS-SMTP: 79BCCA3AC8E06AE64982B5C43B6046DA685819E2D5C8C46CB03FB7D005011D752000:8
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
Cc: Jitao
 Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
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
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi40NzQ2ZWQxNTM1MDcKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3
dW0tbmw2LnR4dApAQCAtMCwwICsxLDM0IEBACitCb2UgQ29ycG9yYXRpb24gMTAuMSIgV1VYR0Eg
VEZUIExDRCBwYW5lbAorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91
bGQgYmUgImJvZSx0djEwMXd1bS1ubDYiCistIHJlZzogdGhlIHZpcnR1YWwgY2hhbm5lbCBudW1i
ZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAorLSBlbmFibGUtZ3Bpb3M6IGEgZ3BpbyBzcGVjIGZvciB0
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
