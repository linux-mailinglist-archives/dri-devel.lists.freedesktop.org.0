Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EEB14B05
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9505389938;
	Mon,  6 May 2019 13:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1524089938
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:38:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BE633019898;
 Mon,  6 May 2019 13:38:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18E5B27091;
 Mon,  6 May 2019 13:38:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 412911747B; Mon,  6 May 2019 15:38:22 +0200 (CEST)
Date: Mon, 6 May 2019 15:38:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Robert Foss <robert.foss@collabora.com>
Subject: Re: [PATCH v2] drm/virtio: Remove redundant return type
Message-ID: <20190506133822.osgwr3rmqclyravf@sirius.home.kraxel.org>
References: <20190506091034.30289-1-robert.foss@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506091034.30289-1-robert.foss@collabora.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 06 May 2019 13:38:23 +0000 (UTC)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMTE6MTA6MzRBTSArMDIwMCwgUm9iZXJ0IEZvc3Mgd3Jv
dGU6Cj4gdmlydGlvX2dwdV9mZW5jZV9lbWl0KCkgYWx3YXlzIHJldHVybnMgMCwgc2luY2UgaXQK
PiBoYXMgbm8gZXJyb3IgcGF0aHMuCj4gCj4gQ29uc2VxdWVudGx5IG5vIGNhbGxzIGZvciB2aXJ0
aW9fZ3B1X2ZlbmNlX2VtaXQoKQo+IHVzZSB0aGUgcmV0dXJuIHZhbHVlLCBhbmQgaXQgY2FuIGJl
IHJlbW92ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEZvc3MgPHJvYmVydC5mb3NzQGNv
bGxhYm9yYS5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgo+IFJldmlld2VkLWJ5OiBDaGlhLUkgV3UgPG9sdmFmZmVAZ21haWwuY29t
PgoKUHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgp0aGFua3MsCiAgR2VyZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
