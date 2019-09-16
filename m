Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D867BB3357
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 04:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03BA6E0C1;
	Mon, 16 Sep 2019 02:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E2976E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 02:30:11 +0000 (UTC)
X-UUID: 284ddd131a8f430c9f4c6764bde33556-20190916
X-UUID: 284ddd131a8f430c9f4c6764bde33556-20190916
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1249094095; Mon, 16 Sep 2019 10:30:02 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Sep 2019 10:30:01 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Sep 2019 10:30:00 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/8] dt-bindings: display: panel: add auo kd101n80-45na
 panel bindings
Date: Mon, 16 Sep 2019 10:29:36 +0800
Message-ID: <20190916022941.15404-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916022941.15404-1-jitao.shi@mediatek.com>
References: <20190916022941.15404-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F4B56E43757064A8706872CAB9EAB5E9F81D92E4BEA5E7708654EAA1CAC1080C2000:8
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRvY3VtZW50YXRpb24gZm9yIGF1byBrZDEwMW44MC00NW5hIHBhbmVsLgoKU2lnbmVkLW9m
Zi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIC4uLi9kaXNwbGF5L3BhbmVsL2F1byxr
ZDEwMW44MC00NW5hLnR4dCAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOTk0YzJhMTNmOTQyCi0tLSAvZGV2L251bGwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtk
MTAxbjgwLTQ1bmEudHh0CkBAIC0wLDAgKzEsMzQgQEAKK0FVTyBDb3Jwb3JhdGlvbiAxMC4xIiBX
VVhHQSBURlQgTENEIHBhbmVsCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6
IHNob3VsZCBiZSAiYXVvLGtkMTAxbjgwLTQ1bmEiCistIHJlZzogdGhlIHZpcnR1YWwgY2hhbm5l
bCBudW1iZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAorLSBlbmFibGUtZ3Bpb3M6IGEgR1BJTyBzcGVj
IGZvciB0aGUgZW5hYmxlIHBpbgorLSBwcDE4MDAtc3VwcGx5OiBjb3JlIHZvbHRhZ2Ugc3VwcGx5
CistIGF2ZGQtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyBw
b3NpdGl2ZSB2b2x0YWdlCistIGF2ZWUtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3Ig
dGhhdCBwcm92aWRlcyBuZWdhdGl2ZSB2b2x0YWdlCistIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0
aGUgYmFja2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKKworVGhlIGRldmljZSBu
b2RlIGNhbiBjb250YWluIG9uZSAncG9ydCcgY2hpbGQgbm9kZSB3aXRoIG9uZSBjaGlsZAorJ2Vu
ZHBvaW50JyBub2RlLCBhY2NvcmRpbmcgdG8gdGhlIGJpbmRpbmdzIGRlZmluZWQgaW4KK21lZGlh
L3ZpZGVvLWludGVyZmFjZXMudHh0LiBUaGlzIG5vZGUgc2hvdWxkIGRlc2NyaWJlIHBhbmVsJ3Mg
dmlkZW8gYnVzLgorCitFeGFtcGxlOgorJmRzaSB7CisJLi4uCisJcGFuZWxAMCB7CisJCWNvbXBh
dGlibGUgPSAiYXVvLGtkMTAxbjgwLTQ1bmEiOworCQlyZWcgPSA8MD47CisJCWVuYWJsZS1ncGlv
cyA9IDwmcGlvIDQ1IDA+OworCQlhdmRkLXN1cHBseSA9IDwmcHB2YXJuX2xjZD47CisJCWF2ZWUt
c3VwcGx5ID0gPCZwcHZhcnBfbGNkPjsKKwkJcHAxODAwLXN1cHBseSA9IDwmcHAxODAwX2xjZD47
CisJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+OworCQlzdGF0dXMgPSAib2theSI7CisJ
CXBvcnQgeworCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8
JmRzaV9vdXQ+OworCQkJfTsKKwkJfTsKKwl9OworfTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
