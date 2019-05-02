Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B411A67
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 15:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0142A89683;
	Thu,  2 May 2019 13:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5548966C;
 Thu,  2 May 2019 13:40:19 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 06:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,421,1549958400"; d="scan'208";a="154145907"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.0.88])
 by FMSMGA003.fm.intel.com with ESMTP; 02 May 2019 06:40:16 -0700
Date: Thu, 2 May 2019 16:40:15 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20190502134015.GA22891@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSAmIERhbmllbCwKCkEgcXVpY2sgZml4IHRvIHVuYnJlYWsgbWVkaWEgZHJpdmVyLCB3
b3J0aHkgaW5jbHVzaW9uIGJlZm9yZSB0aGUgbWVyZ2Ugd2luZG93LgoKQmVzdCBSZWdhcmRzLApK
b29uYXMKCioqKgoKZHJtLWludGVsLW5leHQtZml4ZXMtMjAxOS0wNS0wMjoKCi0gV2hpdGVsaXN0
IGEgcmVnaXN0ZXIgdG8gYXZvaWQgbWVkaWEgZHJpdmVyIGZyb20gaGFuZ2luZwoKVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4NzlhNGU3MGY5NmEyNmE5MzY4YTNjYWVkMmY1NTJh
YTY3MTA1ODUyOgoKICBkcm0vaTkxNTogRml4IElDTCBvdXRwdXQgQ1NDIHByb2dyYW1taW5nICgy
MDE5LTA0LTI5IDA5OjQ5OjIxICswMzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwg
dGFncy9kcm0taW50ZWwtbmV4dC1maXhlcy0yMDE5LTA1LTAyCgpmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gOTYyOGUxNWNhOWQ1Zjc1OTViYTg4NjE3M2U5OGExMzlkMGE1NmNkMToKCiAg
ZHJtL2k5MTUvaWNsOiBXaGl0ZWxpc3QgR0VOOV9TTElDRV9DT01NT05fRUNPX0NISUNLRU4xICgy
MDE5LTA0LTMwIDEwOjE2OjE4ICswMzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotIFdoaXRlbGlzdCBhIHJlZ2lzdGVy
IHRvIGF2b2lkIG1lZGlhIGRyaXZlciBmcm9tIGhhbmdpbmcKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVHZydGtvIFVyc3Vs
aW4gKDEpOgogICAgICBkcm0vaTkxNS9pY2w6IFdoaXRlbGlzdCBHRU45X1NMSUNFX0NPTU1PTl9F
Q09fQ0hJQ0tFTjEKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3JrYXJvdW5kcy5jIHwg
NyArKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
