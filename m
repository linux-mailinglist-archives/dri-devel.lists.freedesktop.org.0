Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0985DA5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 11:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257C86E6BF;
	Thu,  8 Aug 2019 09:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5756E69C;
 Thu,  8 Aug 2019 09:01:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 02:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="186287426"
Received: from jmaier-mobl.ger.corp.intel.com (HELO [10.249.34.77])
 ([10.249.34.77])
 by orsmga002.jf.intel.com with ESMTP; 08 Aug 2019 02:01:24 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <ace294a6-6bb2-d9b1-695d-3260e1d60831@linux.intel.com>
Date: Thu, 8 Aug 2019 11:01:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
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

ZHJtLW1pc2MtZml4ZXMtMjAxOS0wOC0wODoKZHJtLW1pc2MtZml4ZXMgZm9yIHY1LjMtcmM0Ogot
IFN1c3BlbmQgZml4IGZvciByb2NrY2hpcAotIEZpeCB1bnRlcm1pbmF0ZWQgc3RybmNweSBjbWRs
aW5lIG1vZGUgcGFyc2VyClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNTg1NDA1
OTQ1NzA3NzhmZDE0OWNkOGM5YjJiZmY2MWYyY2VmYThjOToKCiAgZHJtL2JvY2hzOiBVc2Ugc2hh
ZG93IGJ1ZmZlciBmb3IgYm9jaHMgZnJhbWVidWZmZXIgY29uc29sZSAoMjAxOS0wOC0wMSAxNTow
MTo0MiArMDIwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBn
aXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFncy9kcm0tbWlzYy1m
aXhlcy0yMDE5LTA4LTA4Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjdjY2JlZDY1
NmY3ODIxMjU5M2NhOTY1ZDlhOGYzNGJmMjRlMGFhYjoKCiAgZHJtL3JvY2tjaGlwOiBTdXNwZW5k
IERQIGxhdGUgKDIwMTktMDgtMDUgMTA6MjY6MTIgLTA0MDApCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS1taXNjLWZp
eGVzIGZvciB2NS4zLXJjNDoKLSBTdXNwZW5kIGZpeCBmb3Igcm9ja2NoaXAKLSBGaXggdW50ZXJt
aW5hdGVkIHN0cm5jcHkgY21kbGluZSBtb2RlIHBhcnNlcgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDaHVob25nIFl1YW4g
KDEpOgogICAgICBkcm0vbW9kZXM6IEZpeCB1bnRlcm1pbmF0ZWQgc3RybmNweQoKRG91Z2xhcyBB
bmRlcnNvbiAoMSk6CiAgICAgIGRybS9yb2NrY2hpcDogU3VzcGVuZCBEUCBsYXRlCgogZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2Rlcy5jICAgICAgICAgICAgICAgICAgICAgfCA0ICsrKy0KIGRyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9hbmFsb2dpeF9kcC1yb2NrY2hpcC5jIHwgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
