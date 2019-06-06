Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4984436DA2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54053895C4;
	Thu,  6 Jun 2019 07:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BC2895C4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 07:45:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD79B30BB54A;
 Thu,  6 Jun 2019 07:45:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
 [10.36.117.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 693BF6764A;
 Thu,  6 Jun 2019 07:45:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 664C511AAF; Thu,  6 Jun 2019 09:45:15 +0200 (CEST)
Date: Thu, 6 Jun 2019 09:45:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Ignore drm_gem_vram_mm_funcs in generated
 documentation
Message-ID: <20190606074515.wlyzzlqdv7r2urum@sirius.home.kraxel.org>
References: <20190604111330.25324-1-tzimmermann@suse.de>
 <20190605090308.efdkhxqnaydorubm@sirius.home.kraxel.org>
 <fe2df569-da1f-a54c-8a8e-e921a979278f@suse.de>
 <20190605155847.gabpvcoc6zf3twfv@sirius.home.kraxel.org>
 <3b574a1c-8dee-962f-e2ad-4959e75321d7@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b574a1c-8dee-962f-e2ad-4959e75321d7@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 06 Jun 2019 07:45:16 +0000 (UTC)
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
Cc: maxime.ripard@bootlin.com, sean@poorly.run, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDg6Mzk6MTJBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAwNS4wNi4xOSB1bSAxNzo1OCBzY2hyaWViIEdlcmQgSG9m
Zm1hbm46Cj4gPiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAxMTo1OTowNEFNICswMjAwLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToKPiA+PiBIaQo+ID4+Cj4gPj4gQW0gMDUuMDYuMTkgdW0gMTE6
MDMgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+ID4+PiBPbiBUdWUsIEp1biAwNCwgMjAxOSBhdCAw
MToxMzozMFBNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiA+Pj4+IFRoZSBkb2N1
bWVudGF0aW9uIHRvb2xzIGludGVycHJldCBkcm1fZ2VtX3ZyYW1fbW1fZnVuY3MgYXMgZnVuY3Rp
b24gYW5kCj4gPj4+PiB0aGVyZSBhcHBlYXJzIHRvIGJlIG5vIHdheSBvZiBpbmxpbmUtZG9jdW1l
bnRpbmcgY29uc3RhbnRzLgo+ID4+Pgo+ID4+Pj4gLS8qKgo+ID4+Pj4gKy8qCj4gPj4+PiAgICog
ZHJtX2dlbV92cmFtX21tX2Z1bmNzIC0gRnVuY3Rpb25zIGZvciAmc3RydWN0IGRybV92cmFtX21t
Cj4gPj4+Cj4gPj4+ICJzdHJ1Y3QgZHJtX2dlbV92cmFtX21tX2Z1bmNzIiA/Cj4gPj4+Cj4gPj4+
IChzZWUgaW5jbHVkZS9kcm0vZHJtX2dlbS5oIHdoZXJlIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9m
dW5jcyBpcwo+ID4+PiBkb2N1bWVudGVkIHRoYXQgd2F5KS4KPiA+Pgo+ID4+IFRoZSBkb2N1bWVu
dGVkIHNvdXJjZSBsaW5lIGlzCj4gPj4KPiA+PiAgIGNvbnN0IHN0cnVjdCBkcm1fdnJhbV9tbV9m
dW5jcyBkcm1fZ2VtX3ZyYW1fbW1fZnVuY3MgPSB7Cj4gPj4KPiA+PiBhbmQgSSB0cmllZCB0byBk
b2N1bWVudCB0aGUgcHVycG9zZSBvZiB0aGUgY29uc3RhbnQgJ2RybV9nZW1fdnJhbV9tbV9mdW5j
cycuCj4gPiAKPiA+IEFoLiAgTWlzc2VkIHRoYXQgZGV0YWlsLgo+ID4gCj4gPj4gRG9jdW1lbnRp
bmcgZ2xvYmFsIGNvbnN0YW50cyBpcyBub3QgZGVzY3JpYmVkIGluIHRoZSBrZXJuZWwgZ3VpZGUg
YW5kIEkKPiA+PiBjb3VsZCBub3QgZmluZCBhIHNvdXJjZS1jb2RlIGV4YW1wbGUgZWl0aGVyLiBG
dW5jdGlvbiBhbmQgc3RydWN0IHN0eWxlCj4gPj4gd2l0aCAnLScgZGlkbid0IHdvcms7IG1lbWJl
ci1maWVsZCBzdHlsZSB3aXRoICdAJyBuZWl0aGVyLiBUaGUgb25seSB3YXkKPiA+PiBzZWVtcyB0
byBiZSBhZGRpbmcgaXQgdG8gYW4gLnJzdCBmaWxlIGluIERvY3VtZW50YXRpb24uIEJ1dCB0aGVu
IGl0J3MKPiA+PiBub3QgcGFydCBvZiB0aGUgQVBJIGRvY3VtZW50YXRpb24sIGJ1dCBzb21ld2hl
cmUgaW4gdGhlIHRleHQuCj4gPiAKPiA+IE9rLCBwYXRjaCBpcyBmaW5lIHRoZW4uCj4gPiAKPiA+
IEFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAKPiBUaGFua3Mu
Cj4gCj4gPiAoY2FuIHlvdSBjb21taXQgJiBwdXNoIHlvdXJzZWxmIG1lYW53aGlsZT8pCj4gCj4g
Tm90IHlldC4gVGhlIHJlc3BlY3RpdmUgYnVnIHJlcG9ydCBpcyBzdGlsbCBvcGVuLgoKT2ssIEkn
bGwgcHVzaCBpdCB0aGVuLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
