Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B66CAA9B72
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F395D89E65;
	Thu,  5 Sep 2019 07:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550F89E65;
 Thu,  5 Sep 2019 07:14:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D698A10567;
 Thu,  5 Sep 2019 07:14:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D87B60606;
 Thu,  5 Sep 2019 07:14:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4BA8531E76; Thu,  5 Sep 2019 09:14:07 +0200 (CEST)
Date: Thu, 5 Sep 2019 09:14:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jaak Ristioja <jaak@ristioja.ee>
Subject: Re: Xorg indefinitely hangs in kernelspace
Message-ID: <20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
References: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 05 Sep 2019 07:14:09 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDk6MDA6MTBQTSArMDMwMCwgSmFhayBSaXN0aW9qYSB3
cm90ZToKPiBIZWxsbyEKPiAKPiBJJ20gd3JpdGluZyB0byByZXBvcnQgYSBjcmFzaCBpbiB0aGUg
UVhMIC8gRFJNIGNvZGUgaW4gdGhlIExpbnV4IGtlcm5lbC4KPiBJIG9yaWdpbmFsbHkgZmlsZWQg
dGhlIGlzc3VlIG9uIExhdW5jaFBhZCBhbmQgbW9yZSBkZXRhaWxzIGNhbiBiZSBmb3VuZAo+IHRo
ZXJlLCBhbHRob3VnaCBJIGRvdWJ0IHdoZXRoZXIgdGhlc2UgZGV0YWlscyBhcmUgdXNlZnVsLgoK
QW55IGNoYW5nZSB3aXRoIGtlcm5lbCA1LjMtcmM3ID8KCmNoZWVycywKICBHZXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
