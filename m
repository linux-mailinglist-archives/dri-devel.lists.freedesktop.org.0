Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B16750F3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C59C6E2B2;
	Thu, 25 Jul 2019 14:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15446E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:24:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C9D8D80502;
 Thu, 25 Jul 2019 16:24:54 +0200 (CEST)
Date: Thu, 25 Jul 2019 16:24:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: OLED panel brightness support
Message-ID: <20190725142452.GA31803@ravnborg.org>
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
 <20190724114851.GY15868@phenom.ffwll.local>
 <30f693a33f5a45ce84673fd8d7cecc7a@AUSX13MPC105.AMER.DELL.COM>
 <42946AB1-3732-467D-ABC9-C7ED3C9C4D06@canonical.com>
 <20190725115909.GA15868@phenom.ffwll.local>
 <20190725131239.GA8684@ravnborg.org>
 <CAKMK7uHfR8vP65gWb=RjHAQwKTAtiAfzVeDt2Zff5baqKY3TVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHfR8vP65gWb=RjHAQwKTAtiAfzVeDt2Zff5baqKY3TVw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=9LpwvehY4HjCM5tqP6UA:9 a=CjuIK1q_8ugA:10
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anthony Wong <anthony.wong@canonical.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKPiA+Cj4gPiBIbW0uLi4gYnJvd3NpbmcgYmFja2xpZ2h0IGNvZGUgSSBzZWUg
dGhhdCBGQl9FQVJMWV9FVkVOVF9CTEFOSyBhbmQgRkJfUl9FQVJMWV9FVkVOVF9CTEFOSwo+ID4g
YXJlIG5vdCB1c2VkIC0gdGltZSB0byBkZWxldGUgc29tZSBjb2RlLi4uCj4gCj4gNS4zLXJjMSBo
YXMgcGF0Y2hlcyBmcm9tIG1lIHRvIGZpeCB0aGF0LCBpdCdzIGdvbmUgYWxyZWFkeS4gVGhlc2Ug
dHdvCj4gZXZlbnRzIGFyZSBnb25lIGZyb20gdGhlIGJhY2tsaWdodCBjb2RlLiBUaGV5J3JlIHN0
aWxsIHVzZWQgYnkgdGhlIGxjZAo+IGRyaXZlciBzdHVmZiBpbiBiYWNrbGlnaHQvbGNkLmMuCgpi
YWNrbGlnaHQvbGNkLmMgY2FsbCB0aGUgY2FsbGJhY2tzLgpCdXQgdGhlIGNhbGxiYWNrcyBhcmUg
bmV2ZXIgc2V0IHNvIHdlIGNhbiBkcm9wIHRoZSBzdXBwb3J0LgoKUGF0Y2ggY29taW5nLCB5b3Ug
YXJlIGNjOgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
