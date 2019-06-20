Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332B4CD73
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 14:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B976E291;
	Thu, 20 Jun 2019 12:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D717F6E291;
 Thu, 20 Jun 2019 12:10:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 05:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; d="scan'208";a="181848119"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2019 05:10:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 20 Jun 2019 15:13:22 +0300
Message-ID: <87pnn8sbdp.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKZHJtLWludGVsLWZpeGVzLTIwMTktMDYtMjA6CmRybS9pOTE1
IGZpeGVzIGZvciB2NS4yLXJjNjoKLSBHVlQ6IEZpeCByZXNlcnZlZCBQVklORk8gcmVnaXN0ZXIg
d3JpdGUgKFdlaW5hbikKLSBBdm9pZCBjbG9iYmVyaW5nIE0vTiB2YWx1ZXMgaW4gZmFzdHNldCBm
dXp6eSBjaGVja3MgKFZpbGxlKQoKQlIsCkphbmkuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IDllMGJhYmYyYzA2YzczY2RhMmMwY2QzN2ExNjUzZDgyM2FkYjQwZWM6CgogIExp
bnV4IDUuMi1yYzUgKDIwMTktMDYtMTYgMDg6NDk6NDUgLTEwMDApCgphcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcv
ZHJtL2RybS1pbnRlbCB0YWdzL2RybS1pbnRlbC1maXhlcy0yMDE5LTA2LTIwCgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gNDc1ZGY1ZDBmM2ViMmQwMzFlNDUwNWY4NGQ4ZmJhNzViYWFm
MmU4MDoKCiAgZHJtL2k5MTU6IERvbid0IGNsb2JiZXIgTS9OIHZhbHVlcyBkdXJpbmcgZmFzdHNl
dCBjaGVjayAoMjAxOS0wNi0xOSAxNTo1NzowOSArMDMwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtL2k5MTUgZml4
ZXMgZm9yIHY1LjItcmM2OgotIEdWVDogRml4IHJlc2VydmVkIFBWSU5GTyByZWdpc3RlciB3cml0
ZSAoV2VpbmFuKQotIEF2b2lkIGNsb2JiZXJpbmcgTS9OIHZhbHVlcyBpbiBmYXN0c2V0IGZ1enp5
IGNoZWNrcyAoVmlsbGUpCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkphbmkgTmlrdWxhICgxKToKICAgICAgTWVyZ2UgdGFn
ICdndnQtZml4ZXMtMjAxOS0wNi0xOScgb2YgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1s
aW51eCBpbnRvIGRybS1pbnRlbC1maXhlcwoKVmlsbGUgU3lyasOkbMOkICgxKToKICAgICAgZHJt
L2k5MTU6IERvbid0IGNsb2JiZXIgTS9OIHZhbHVlcyBkdXJpbmcgZmFzdHNldCBjaGVjawoKV2Vp
bmFuIExpICgxKToKICAgICAgZHJtL2k5MTUvZ3Z0OiBpZ25vcmUgdW5leHBlY3RlZCBwdmluZm8g
d3JpdGUKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyAgfCAxNSArKysrKysr
Ky0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jIHwgMzggKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNv
dXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
