Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919F74EDF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FFA6E74F;
	Thu, 25 Jul 2019 13:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822416E74F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:12:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A4F03805E5;
 Thu, 25 Jul 2019 15:12:41 +0200 (CEST)
Date: Thu, 25 Jul 2019 15:12:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: OLED panel brightness support
Message-ID: <20190725131239.GA8684@ravnborg.org>
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
 <20190724114851.GY15868@phenom.ffwll.local>
 <30f693a33f5a45ce84673fd8d7cecc7a@AUSX13MPC105.AMER.DELL.COM>
 <42946AB1-3732-467D-ABC9-C7ED3C9C4D06@canonical.com>
 <20190725115909.GA15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725115909.GA15868@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=XEleZmmksK0_83Qk1y0A:9 a=CjuIK1q_8ugA:10
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, anthony.wong@canonical.com,
 dri-devel@lists.freedesktop.org, Mario.Limonciello@dell.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgogCj4gCj4gPiBUaGUgbmV4dCBxdWVzdGlvbiBpcywgaG93IGRvIHdlIGNoYW5n
ZSB0aGUgYnJpZ2h0bmVzcyBsZXZlbCBmb3IgT0xFRAo+ID4gZGlzcGxheXM/IElzIGNoYW5naW5n
IGdhbW1hIHZhbHVlIGEgZ29vZCB3YXkgdG8gZG8gaXQ/Cj4gCj4gVGhlcmUncyBubyBvdmVyYWxs
IGFtcGxpZmllciBrbm9iIHRvIHNldCBnZW5lcmFsIGJyaWdodG5lc3Mgb24gdGhlc2U/CgpJIGp1
c3QgbG9va2VkIHVwIHR3byByYW5kb20gT0xFRCBjb250cm9sbGVycy4KVGhleSBoYXZlIGEgIkNv
bnRyYXN0IiAtIHdoaWNoIGlzIHdpcmVkIHRvIHNldF9nYW1tYS4KU2VlIGZvciBleGFtcGxlOgoK
ZmJfc2gxMTA2LmM6Ci8qIEdhbW1hIGlzIHVzZWQgdG8gY29udHJvbCBDb250cmFzdCAqLwpzdGF0
aWMgaW50IHNldF9nYW1tYShzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIsIHUzMiAqY3VydmVzKQp7CiAg
ICAgICAgLyogYXBwbHkgbWFzayAqLwogICAgICAgIGN1cnZlc1swXSAmPSAweEZGOwoKICAgICAg
ICAvKiBTZXQgQ29udHJhc3QgQ29udHJvbCBmb3IgQkFOSzAgKi8KICAgICAgICB3cml0ZV9yZWco
cGFyLCAweDgxLCBjdXJ2ZXNbMF0pOwoKICAgICAgICByZXR1cm4gMDsKfQoKCkFuZCBmYl9zc2Qx
MzA2LmM6Ci8qIEdhbW1hIGlzIHVzZWQgdG8gY29udHJvbCBDb250cmFzdCAqLwpzdGF0aWMgaW50
IHNldF9nYW1tYShzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIsIHUzMiAqY3VydmVzKQp7CiAgICAgICAg
LyogYXBwbHkgbWFzayAqLwogICAgICAgIGN1cnZlc1swXSAmPSAweEZGOwoKICAgICAgICAvKiBT
ZXQgQ29udHJhc3QgQ29udHJvbCBmb3IgQkFOSzAgKi8KICAgICAgICB3cml0ZV9yZWcocGFyLCAw
eDgxKTsKICAgICAgICB3cml0ZV9yZWcocGFyLCBjdXJ2ZXNbMF0pOwoKICAgICAgICByZXR1cm4g
MDsKfQoKSSBoYXZlIGEgZmV3IHNzZDEzMDYgcGFuZWxzIGluIHRoZSBtYWlsLCBzbyB3aGVuIEkg
Z2V0IHNvbWUgc3BhcmUgdGltZSBJCndpbGwgdHJ5IHRvIG1ha2UgYSB0aW55IERSTSBkcml2ZXIg
Zm9yIHRoZW0uCkJ1dCBzdGFydGluZyBvbiB0aGUgYmFja2xpZ2h0IHN0dWZmIHNlZW1zIHRvIGEg
Yml0IG1vcmUgY29tcGxpY2F0ZWQuCgpIbW0uLi4gYnJvd3NpbmcgYmFja2xpZ2h0IGNvZGUgSSBz
ZWUgdGhhdCBGQl9FQVJMWV9FVkVOVF9CTEFOSyBhbmQgRkJfUl9FQVJMWV9FVkVOVF9CTEFOSwph
cmUgbm90IHVzZWQgLSB0aW1lIHRvIGRlbGV0ZSBzb21lIGNvZGUuLi4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
