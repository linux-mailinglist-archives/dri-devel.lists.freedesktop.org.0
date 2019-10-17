Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8997DAECF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA92D6EAAB;
	Thu, 17 Oct 2019 13:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790D56EAAB;
 Thu, 17 Oct 2019 13:54:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 06:54:15 -0700
X-IronPort-AV: E=Sophos;i="5.67,307,1566889200"; d="scan'208";a="200394651"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Oct 2019 06:54:15 -0700
Date: Thu, 17 Oct 2019 06:54:44 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20191017135444.GA12255@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKSGVyZSBnb2VzIGRybS1pbnRlbC1maXhlcy0yMDE5LTEwLTE3
OgoKLSBEaXNwbGF5IGZpeCBvbiBoYW5kbGluZyBWQlQgaW5mb3JtYXRpb24uCi0gSW1wb3J0YW50
IGNpcmN1bGFyIGxvY2tpbmcgZml4Ci0gRml4IGZvciBwcmVlbXB0aW9uIHZzIHJlc3VibWlzc2lv
biBvbiB2aXJ0dWFsIHJlcXVlc3RzCiAgLSBhbmQgYSBwcmVwIHBhdGNoIHRvIG1ha2UgdGhpcyBs
YXN0IG9uZSB0byBhcHBseSBjbGVhbmx5CgpUaGFua3MsClJvZHJpZ28uCgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IDRmNWNhZmI1Y2I4NDcxZTU0YWZkYzkwNTRkOTczNTM1NjE0
Zjc2NzU6CgogIExpbnV4IDUuNC1yYzMgKDIwMTktMTAtMTMgMTY6Mzc6MzYgLTA3MDApCgphcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCB0YWdzL2RybS1pbnRlbC1maXhlcy0yMDE5LTEwLTE3
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMGE1NDRhMmE3MjhlMmUzM2JiN2ZjMzhk
ZDU0MmVjYjkwZWUzOTNlYjoKCiAgZHJtL2k5MTU6IEZpeHVwIHByZWVtcHQtdG8tYnVzeSB2cyBy
ZXN1Ym1pc3Npb24gb2YgYSB2aXJ0dWFsIHJlcXVlc3QgKDIwMTktMTAtMTYgMTA6NTc6MzMgLTA3
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCi0gRGlzcGxheSBmaXggb24gaGFuZGxpbmcgVkJUIGluZm9ybWF0aW9uLgot
IEltcG9ydGFudCBjaXJjdWxhciBsb2NraW5nIGZpeAotIEZpeCBmb3IgcHJlZW1wdGlvbiB2cyBy
ZXN1Ym1pc3Npb24gb24gdmlydHVhbCByZXF1ZXN0cwogIC0gYW5kIGEgcHJlcCBwYXRjaCB0byBt
YWtlIHRoaXMgbGFzdCBvbmUgdG8gYXBwbHkgY2xlYW5seQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDaHJpcyBXaWxzb24g
KDMpOgogICAgICBkcm0vaTkxNS9leGVjbGlzdHM6IFJlZmFjdG9yIC1FSU8gbWFya3VwIG9mIGh1
bmcgcmVxdWVzdHMKICAgICAgZHJtL2k5MTUvdXNlcnB0cjogTmV2ZXIgYWxsb3cgdXNlcnB0ciBp
bnRvIHRoZSBtYXBwYWJsZSBHR1RUCiAgICAgIGRybS9pOTE1OiBGaXh1cCBwcmVlbXB0LXRvLWJ1
c3kgdnMgcmVzdWJtaXNzaW9uIG9mIGEgdmlydHVhbCByZXF1ZXN0CgpWaWxsZSBTeXJqw6Rsw6Qg
KDEpOgogICAgICBkcm0vaTkxNTogRmF2b3IgbGFzdCBWQlQgY2hpbGQgZGV2aWNlIHdpdGggY29u
ZmxpY3RpbmcgQVVYIGNoL0REQyBwaW4KCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Jpb3MuYyAgICAgICAgfCAyMiArKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9tbWFuLmMgICAgICAgICB8ICA3ICsrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX29iamVjdC5oICAgICAgIHwgIDYgKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fb2JqZWN0X3R5cGVzLmggfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYyAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfbHJjLmMgICAgICAgICAgICAgIHwgNjMgKysrKysrKysrKysrKysrKy0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jICAgICAgICAgICAgICAgICAgfCAg
MyArKwogNyBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
