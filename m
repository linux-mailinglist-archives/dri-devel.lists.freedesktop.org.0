Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0728D2CD56
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719826E281;
	Tue, 28 May 2019 17:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs20.siol.net [185.57.226.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9686E271
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 17:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 9EE2F52258D;
 Tue, 28 May 2019 19:03:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id wq2yfM6iCzA8; Tue, 28 May 2019 19:03:55 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 5042F523805;
 Tue, 28 May 2019 19:03:55 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id CE07C52258D;
 Tue, 28 May 2019 19:03:52 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
Date: Tue, 28 May 2019 19:03:52 +0200
Message-ID: <2731176.DZk0TneY9u@jernej-laptop>
In-Reply-To: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgbmVkZWxqYSwgMjYuIG1haiAyMDE5IG9iIDIzOjE4OjQ2IENFU1QgamUgSm9uYXMg
S2FybG1hbiBuYXBpc2FsKGEpOgo+IEFkZCBzdXBwb3J0IGZvciBIRFIgbWV0YWRhdGEgdXNpbmcg
dGhlIGhkcl9vdXRwdXRfbWV0YWRhdGEgY29ubmVjdG9yCj4gcHJvcGVydHksICBjb25maWd1cmUg
RHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBhY2NvcmRpbmdseS4KPiAKPiBB
IGRybV9pbmZvZnJhbWUgZmxhZyBpcyBhZGRlZCB0byBkd19oZG1pX3BsYXRfZGF0YSB0aGF0IHBs
YXRmb3JtIGRyaXZlcnMKPiBjYW4gdXNlIHRvIHNpZ25hbCB3aGVuIER5bmFtaWMgUmFuZ2UgYW5k
IE1hc3RlcmluZyBpbmZvZnJhbWVzIGlzIHN1cHBvcnRlZC4KPiBUaGlzIGZsYWcgaXMgbmVlZGVk
IGJlY2F1c2UgQW1sb2dpYyBHWEJCIGFuZCBHWEwgcmVwb3J0IHNhbWUgRFctSERNSQo+IHZlcnNp
b24sIGFuZCBvbmx5IEdYTCBzdXBwb3J0IERSTSBJbmZvRnJhbWUuCj4gCj4gVGhlIGZpcnN0IHBh
dGNoIGFkZCBmdW5jdGlvbmFsaXR5IHRvIGNvbmZpZ3VyZSBEUk0gSW5mb0ZyYW1lIGJhc2VkIG9u
IHRoZQo+IGhkcl9vdXRwdXRfbWV0YWRhdGEgY29ubmVjdG9yIHByb3BlcnR5Lgo+IAo+IFRoZSBy
ZW1haW5pbmcgcGF0Y2hlcyBzZXRzIHRoZSBkcm1faW5mb2ZyYW1lIGZsYWcgb24gc29tZSBTb0Nz
IHN1cHBvcnRpbmcKPiBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgSW5mb0ZyYW1lLgo+IAo+
IE5vdGUgdGhhdCB0aGlzIHdhcyBiYXNlZCBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dCBhbmQgTmVp
bCBBcm1zdHJvbmcncwo+ICJkcm0vbWVzb246IEFkZCBzdXBwb3J0IGZvciBIRE1JMi4wIFlVVjQy
MCA0azYwIiBzZXJpZXMgYXQgWzFdCj4gCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvNTg3MjUvI3JldjIKCkZvciBBbGx3aW5uZXIgSDY6ClRlc3RlZC1ieTog
SmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgoKVGhhbmtzIGZvciB3b3Jr
aW5nIG9uIHRoaXMhCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
