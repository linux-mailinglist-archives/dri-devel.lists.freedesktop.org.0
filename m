Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568AA258914
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56636E5CA;
	Tue,  1 Sep 2020 07:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id E57C989E0E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 01:51:39 +0000 (UTC)
X-UUID: fb863039fb184cd8863257b0da953a10-20200901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qJACcI5q4eOD/v6iC3fhkqz1GyF30C7lbgepzbjso/E=; 
 b=gy8DlTHvfVvc0T6QcfiF9Oi9m5JJMrVlEF+76bawofYPM4epNdaDKMVah5Ss2GOgE00pAd/7VLAd4KVGrk388A6HTiTCygffimyAHr4PpVfIliVFvEc7MZOorj3crNbID+Ju7mYg95LDyzgd9cE0sdOrZ9LUpoZDM9X5venRqaw=;
X-UUID: fb863039fb184cd8863257b0da953a10-20200901
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1891126655; Tue, 01 Sep 2020 09:51:36 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Sep 2020 09:51:31 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Sep 2020 09:51:34 +0800
Message-ID: <1598924999.11403.3.camel@mhfsdcap03>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: add files for Mediatek DRM drivers
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Sep 2020 09:49:59 +0800
In-Reply-To: <CAAOTY_9hZgLGSiqCA6a1Ea+TjGZAH4-t4DFS9jCz3nEXNJY1zg@mail.gmail.com>
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <20200823014830.15962-5-chunkuang.hu@kernel.org>
 <1598838539.7054.9.camel@mhfsdcap03>
 <CAAOTY_9hZgLGSiqCA6a1Ea+TjGZAH4-t4DFS9jCz3nEXNJY1zg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 724E468EB20BBC4E102A084E01A7702051D82B5CA6D15ABC5921E762D5A8F58F2000:8
X-MTK: N
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
 Kishon Vijay Abraham I <kishon@ti.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTA5LTAxIGF0IDAwOjAyICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgQ2h1bmZlbmc6DQo+IA0KPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+IOaWvCAyMDIw5bm0OOaciDMx5pelIOmAseS4gCDkuIrljYg5OjUw5a+r6YGT77yaDQo+
ID4NCj4gPiBPbiBTdW4sIDIwMjAtMDgtMjMgYXQgMDk6NDggKzA4MDAsIENodW4tS3VhbmcgSHUg
d3JvdGU6DQo+ID4gPiBNZWRpYXRlayBIRE1JIHBoeSBkcml2ZXIgaXMgbW92ZWQgZnJvbSBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsgdG8NCj4gPiA+IGRyaXZlcnMvcGh5L21lZGlhdGVrLCBzbyBh
ZGQgdGhlIG5ldyBmb2xkZXIgdG8gdGhlIE1lZGlhdGVrIERSTSBkcml2ZXJzJw0KPiA+ID4gaW5m
b3JtYXRpb24uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1
bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+ID4gPiBSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIE1BSU5UQUlORVJT
IHwgMSArDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gPg0KPiA+
ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gPiA+IGluZGV4IGRl
YWFmYjYxNzM2MS4uMTkxYmFjZjAyMjA5IDEwMDY0NA0KPiA+ID4gLS0tIGEvTUFJTlRBSU5FUlMN
Cj4gPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gPiBAQCAtNTc5Myw2ICs1NzkzLDcgQEAgTDog
ICAgICBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiAgUzogICBTdXBwb3J0
ZWQNCj4gPiA+ICBGOiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrLw0KPiA+ID4gIEY6ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrLw0KPiA+ID4g
K0Y6ICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pKg0KPiA+ID4NCj4gPiA+ICBE
Uk0gRFJJVkVSUyBGT1IgTlZJRElBIFRFR1JBDQo+ID4gPiAgTTogICBUaGllcnJ5IFJlZGluZyA8
dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IENodW5mZW5n
IFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCj4gPg0KPiANCj4gQ291bGQgeW91IGdp
dmUgYW4gJ0Fja2VkLWJ5JyB0YWcgb24gdGhpcyBwYXRjaD8gU28gSSBjb3VsZCBhcHBseSB0aGUN
Cj4gd2hvbGUgc2VyaWVzIGludG8gbXkgdHJlZS4NCkFja2VkLWJ5OiBDaHVuZmVuZyBZdW4gPGNo
dW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQoNClRoYW5rcw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBD
aHVuLUt1YW5nLg0KPiANCj4gPiBUaGFua3MNCj4gPg0KPiA+DQo+ID4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
