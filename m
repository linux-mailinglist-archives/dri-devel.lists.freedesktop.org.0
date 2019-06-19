Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B4B4B61B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2846E364;
	Wed, 19 Jun 2019 10:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C893F6E362;
 Wed, 19 Jun 2019 10:21:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5FF6F3092669;
 Wed, 19 Jun 2019 10:21:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-86.ams2.redhat.com
 [10.36.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21A335D719;
 Wed, 19 Jun 2019 10:21:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5A41C16E05; Wed, 19 Jun 2019 12:21:28 +0200 (CEST)
Date: Wed, 19 Jun 2019 12:21:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/prime: Update docs
Message-ID: <20190619102128.nf2vzr22fezujayo@sirius.home.kraxel.org>
References: <20190614203615.12639-4-daniel.vetter@ffwll.ch>
 <20190618092038.17929-1-daniel.vetter@ffwll.ch>
 <20190618092038.17929-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618092038.17929-2-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 19 Jun 2019 10:21:29 +0000 (UTC)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gLSBQb2xpc2ggZm9yIGFsbCB0aGUgZnVuY3Rpb25zIGFuZCBtb3JlIGNyb3NzIHJl
ZmVyZW5jZXMuCgpUaGF0IGlzIG5pY2UsIGhlbHBzIGZpZ3VydW5nIGhvdyBhbGwgdGhpcyB3b3Jr
cyB0b2dldGhlciB3aXRob3V0IHdhZGluZwp0aHJvdWdoIHRoZSBzb3VyY2UgY29kZSAob3IgYXQg
bGVhc3QgbGVzcyBvZiBpdCkuCgpGb3IgdGhhdCBraW5kIG9mIGNoYW5nZXMgaXQgaXMgcHJvYmFi
bHkgaGVscGZ1bCBmb3IgcmV2aWV3IHRvIGdlbmVyYXRlCnRoZSBkaWZmIHdpdGggbW9yZSBjb250
ZXh0IChzYXkgLS11bmlmaWVkPTEwKSwgc28gaXQgaXMgZWFzaWVyIHRvIHNwb3QKdGhlIGZ1bmN0
aW9uIHdoZXJlIHRoaXMgZG9jIHVwZGF0ZSBiZWxvbmdzIHRvLgoKQWNrZWQtYnk6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
