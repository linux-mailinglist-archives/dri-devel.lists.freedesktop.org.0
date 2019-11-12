Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF0FAB8A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CE86EC8D;
	Wed, 13 Nov 2019 07:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186776EB2A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:10:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C9D8B442;
 Tue, 12 Nov 2019 12:10:15 +0000 (UTC)
Date: Tue, 12 Nov 2019 13:10:13 +0100
From: Torsten Duwe <duwe@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [drm-drm-misc:drm-misc-next 5/5] include/linux/kernel.h:994:32:
 error: dereferencing pointer to incomplete type 'struct drm_bridge'
Message-ID: <20191112121013.GA31859@suse.de>
References: <201911112308.UOBDjIac%lkp@intel.com>
 <20191112092239.GT4345@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112092239.GT4345@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
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
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTA6MjI6MzlBTSArMDEwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBIaSBUaG9yc3RlbiwKPiAKPiBPbiBNb24sIE5vdiAxMSwgMjAxOSBhdCAxMTo1Mzoy
MFBNICswODAwLCBrYnVpbGQgdGVzdCByb2JvdCB3cm90ZToKPiA+Cj4gPiAgICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYzo0ODoyMDogZXJyb3I6IGZp
ZWxkICdicmlkZ2UnIGhhcyBpbmNvbXBsZXRlIHR5cGUKPiA+ICAgICAgc3RydWN0IGRybV9icmlk
Z2UgYnJpZGdlOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KPiA+ICAgIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jOjUyOjIxOiBlcnJv
cjogZmllbGQgJ2xpbmsnIGhhcyBpbmNvbXBsZXRlIHR5cGUKPiA+ICAgICAgc3RydWN0IGRybV9k
cF9saW5rIGxpbms7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBefn5+Cj4gCj4gSXQgbG9v
a3MgbGlrZSB5b3UgZGlkbid0IGNvbXBpbGUgeW91ciBkcml2ZXIgYWZ0ZXIgcmViYXNpbmcuCgpG
V0lXIEkgY29tcGlsZWQgYW5kIHJhbiB0aGUgcmViYXNlZCBzZXJpZXMsIGJhc2VkIG9uIDUuNC1y
YzYgKyAwMjU5MTBkYjguCldobyBuZWVkcyBzdGFibGUgaW4ta2VybmVsIGludGVyZmFjZXMgYW55
d2F5IDotLwoKPiBUaGUgZmlyc3QgZXJyb3IgaGVyZSBpcyBwcmV0dHkgdHJpdmlhbCAobWlzc2lu
ZyBkcm1fYnJpZGdlLmggaW5jbHVkZSksCj4gYnV0IHRoZSBzZWNvbmQgb25lIGlzIHRoZXJlIGJl
Y2F1cyB0aGUgRFAgbGluayBoZWxwZXJzIHlvdSByZWx5IG9uCj4gaGF2ZSBiZWVuIHJlbW92ZWQu
Cj4gCj4gQ2FuIHlvdSBzZW5kIGEgcGF0Y2ggdG8gZml4IHRoaXM/IE90aGVyd2lzZSwgd2UgY2Fu
IGp1c3QgcmV2ZXJ0IHRoZQo+IG9mZmVuZGluZyBwYXRjaC4KCmh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjgwMzEvIHBhc3NlZCBtZSBieSB1bm5vdGljZWQ7Ckkgd29u
ZGVyIHdoeSBJIENjJ2VkIFRoaWVycnkgb24gZXZlcnkgc2luZ2xlIHBhdGNoPyBBIHNpbXBsZSBo
ZWFkcy11cCB3b3VsZApoYXZlIHN1ZmZpY2VkLgoKTm93IHRoYXQgSSBoYXZlIHRoYXQgc2VyaWVz
LCBJJ20gY29uZmlkZW50IEkgY2FuIHVwZGF0ZSB0aGUgYW54NjM0NSBkcml2ZXIKYWNjb3JkaW5n
bHkuCgpTdGF5IHR1bmVkLi4uCgoJVG9yc3RlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
