Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FA32AB2D0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C6589623;
	Mon,  9 Nov 2020 08:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33D0189471
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 01:47:17 +0000 (UTC)
X-UUID: ddfddffd2ea0464d873a0b59667f16e6-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=P2/u2G2PWkxrVDOi7euvixdoAYgr4i4zVGrK1c98XqI=; 
 b=bW6/AYYJ6dsXDslM5kKRFAy0RAuZ8lA20HPypc+46xtn2jRAvNHpwUR5TLHeO4pCh3zkYX/xcpa5sRu2dwXIhQJClxcNiUPNsek+1MxvHCa9ZmMuHhXYbi/upqwqmnpyKO4Qi/1cxI4g694YtN0elmY8KsqCbqhcuvxlAhVii0E=;
X-UUID: ddfddffd2ea0464d873a0b59667f16e6-20201109
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1578670776; Mon, 09 Nov 2020 09:47:12 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 Nov 2020 09:47:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 09:47:10 +0800
Message-ID: <1604886429.31607.20.camel@mhfsdcap03>
Subject: Re: [PATCH 3/3] MAINTAINERS: add files for Mediatek DRM drivers
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Nov 2020 09:47:09 +0800
In-Reply-To: <CAAOTY__ZRLubBfNtMFMax8SubM9f9iKLXGzS+bXseXcd9V0Smg@mail.gmail.com>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-4-chunkuang.hu@kernel.org>
 <CAAOTY__ZRLubBfNtMFMax8SubM9f9iKLXGzS+bXseXcd9V0Smg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 18D2AF7C1A1FFBD221F4820A9D115C9E1FA2F4AA454C834A65245B32E995E8E02000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIwLTExLTA4IGF0IDExOjA0ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiArIFZpbm9kOg0KPiANCj4gSGksIENodW5mZW5nOg0KPiANCj4gQ2h1bi1LdWFuZyBIdSA8Y2h1
bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDmnIgyOeaXpSDpgLHlm5sg5LiL5Y2I
MTE6Mjjlr6vpgZPvvJoNCj4gPg0KPiA+IE1lZGlhdGVrIE1JUEkgRFNJIHBoeSBkcml2ZXIgaXMg
bW92ZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsgdG8NCj4gPiBkcml2ZXJzL3BoeS9t
ZWRpYXRlaywgc28gYWRkIHRoZSBuZXcgZm9sZGVyIHRvIHRoZSBNZWRpYXRlayBEUk0gZHJpdmVy
cycNCj4gPiBpbmZvcm1hdGlvbi4NCj4gDQo+IFdvdWxkIHlvdSBsaWtlIHRoaXMgcGF0Y2g/IElm
IHNvLCB5b3UgY291bGQgZ2l2ZSBhbiBhY2tlZC1ieSB0YWcgb24NCj4gdGhpcyBwYXRjaCwgc28g
SSBjb3VsZCBhcHBsaWVkIHRoZSB3aG9sZSBzZXJpZXMgaW50byBteSB0cmVlLg0KQWNrZWQtYnk6
IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCg0KVGhhbmtzDQoNCj4g
DQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4gIE1B
SU5UQUlORVJTIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gPiBpbmRleCBl
NzM2MzZiNzVmMjkuLjE0ZjUwMThjMDFiNiAxMDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0K
PiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gQEAgLTU4NjcsNiArNTg2Nyw3IEBAIFM6ICAgICAg
ICBTdXBwb3J0ZWQNCj4gPiAgRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrLw0KPiA+ICBGOiAgICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
Lw0KPiA+ICBGOiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pKg0KPiA+ICtG
OiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpKg0KPiA+DQo+ID4gIERSTSBE
UklWRVJTIEZPUiBOVklESUEgVEVHUkENCj4gPiAgTTogICAgIFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+DQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gPg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
