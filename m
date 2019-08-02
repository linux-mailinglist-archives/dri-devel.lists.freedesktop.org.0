Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269DA7FB2A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941A26EE59;
	Fri,  2 Aug 2019 13:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762336EE58;
 Fri,  2 Aug 2019 13:38:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0291A308A958;
 Fri,  2 Aug 2019 13:38:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96ADE10016EA;
 Fri,  2 Aug 2019 13:38:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9F51516E05; Fri,  2 Aug 2019 15:38:36 +0200 (CEST)
Date: Fri, 2 Aug 2019 15:38:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <20190802133836.db5riluulovdrw7w@sirius.home.kraxel.org>
References: <87d0hnncgo.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d0hnncgo.fsf@intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 02 Aug 2019 13:38:38 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, dim-tools@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gSSBhcG9sb2dpemUgZm9yIG5vdCBoYXZpbmcgZml4ZXMgZm9yIGEgY291cGxlIG9m
IHdlZWtzLCBhbmQgdGhlbiBzaG93aW5nCj4gdXAgbGF0ZSB3aXRoIGEgYnVuY2ggb2YgdGhlbS4g
SSBzYXcgRGF2ZSBtYWtlIHRoZSBmaXhlcyBwdWxsIHRvIExpbnVzCj4gZm9yIC1yYzMgYWxyZWFk
eSwgYnV0IEkgbXVzdCBodW1ibHkgYXNrIHlvdSB0byBhY2NvbW1vZGF0ZSBhbiBleHRyYQo+IGZp
eGVzIHB1bGwuCgpJZiB0aGVyZSBpcyBhbiBleHRyYSAtcmMzIGZpeGVzIHB1bGwgYW55d2F5IGl0
IHdvdWxkIGJlIG5pY2UgdG8gYWxzbwpwaWNrIHVwIHRoZSBkcm0tbWlzYy1maXhlcyBwYXRjaGVz
IHRvIHVuYnJlYWsgcWVtdSBzdGR2Z2EgZmJjb24uCgp0aGFua3MsCiAgR2VyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
