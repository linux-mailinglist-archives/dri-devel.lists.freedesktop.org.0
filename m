Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C68F35938
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 11:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8B68931D;
	Wed,  5 Jun 2019 09:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395E68931D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 09:03:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD11530820E6;
 Wed,  5 Jun 2019 09:03:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
 [10.36.117.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EF1719C6A;
 Wed,  5 Jun 2019 09:03:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3E9BF16E1A; Wed,  5 Jun 2019 11:03:08 +0200 (CEST)
Date: Wed, 5 Jun 2019 11:03:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Ignore drm_gem_vram_mm_funcs in generated
 documentation
Message-ID: <20190605090308.efdkhxqnaydorubm@sirius.home.kraxel.org>
References: <20190604111330.25324-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604111330.25324-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 05 Jun 2019 09:03:14 +0000 (UTC)
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

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDE6MTM6MzBQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGRvY3VtZW50YXRpb24gdG9vbHMgaW50ZXJwcmV0IGRybV9nZW1fdnJh
bV9tbV9mdW5jcyBhcyBmdW5jdGlvbiBhbmQKPiB0aGVyZSBhcHBlYXJzIHRvIGJlIG5vIHdheSBv
ZiBpbmxpbmUtZG9jdW1lbnRpbmcgY29uc3RhbnRzLgoKPiAtLyoqCj4gKy8qCj4gICAqIGRybV9n
ZW1fdnJhbV9tbV9mdW5jcyAtIEZ1bmN0aW9ucyBmb3IgJnN0cnVjdCBkcm1fdnJhbV9tbQoKInN0
cnVjdCBkcm1fZ2VtX3ZyYW1fbW1fZnVuY3MiID8KCihzZWUgaW5jbHVkZS9kcm0vZHJtX2dlbS5o
IHdoZXJlIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBpcwpkb2N1bWVudGVkIHRoYXQgd2F5
KS4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
