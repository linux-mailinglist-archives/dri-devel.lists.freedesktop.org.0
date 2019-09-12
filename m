Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6925CB0954
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9D26EBF8;
	Thu, 12 Sep 2019 07:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08FB6EBEC;
 Thu, 12 Sep 2019 07:13:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 00:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; d="scan'208";a="209928800"
Received: from cmflorex-mobl2.gar.corp.intel.com (HELO [10.252.38.169])
 ([10.252.38.169])
 by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2019 00:13:48 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <99e52e7a-d4ce-6a2c-0501-bc559a710955@linux.intel.com>
Date: Thu, 12 Sep 2019 09:13:47 +0200
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtLW1pc2MtZml4ZXMtMjAxOS0wOS0xMjoKZHJtLW1pc2MtZml4ZXMgZm9yIHY1LjMgZmluYWw6
Ci0gQ29uc3RpZnkgbW9kZXMgd2hpdGVsaXN0IGhhcmRlci4KLSBGaXggbGltYSBkcml2ZXIgZ2Vt
X3dhaXQgaW9jdGwuClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNDI0YzM4YTRl
MzI1MDlhZTgyZGM5ZDczMDA0MzIyOTU4MDZjYjkxMToKCiAgZHJtL3NlbGZ0ZXN0czogbW9kZXM6
IEFkZCBtb3JlIHVuaXQgdGVzdHMgZm9yIHRoZSBjbWRsaW5lIHBhcnNlciAoMjAxOS0wOC0zMCAx
MDoyMTo1NiArMDIwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFncy9kcm0tbWlz
Yy1maXhlcy0yMDE5LTA5LTEyCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMjE2NzBi
ZDc4YTI1MDAxY2Y4ZWYyNjc5YjM3OGM3M2ZiNzNiOTA0ZjoKCiAgZHJtL2xpbWE6IGZpeCBsaW1h
X2dlbV93YWl0KCkgcmV0dXJuIHZhbHVlICgyMDE5LTA5LTEwIDEwOjA5OjAwICswODAwKQoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpkcm0tbWlzYy1maXhlcyBmb3IgdjUuMyBmaW5hbDoKLSBDb25zdGlmeSBtb2RlcyB3aGl0
ZWxpc3QgaGFyZGVyLgotIEZpeCBsaW1hIGRyaXZlciBnZW1fd2FpdCBpb2N0bC4KCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
TWF4aW1lIFJpcGFyZCAoMSk6CiAgICAgIGRybS9tb2RlczogTWFrZSB0aGUgd2hpdGVsaXN0IG1v
cmUgY29uc3QKClZhc2lseSBLaG9ydXpoaWNrICgxKToKICAgICAgZHJtL2xpbWE6IGZpeCBsaW1h
X2dlbV93YWl0KCkgcmV0dXJuIHZhbHVlCgogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jICAg
ICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
