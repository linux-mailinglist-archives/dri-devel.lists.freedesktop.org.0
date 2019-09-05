Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538CCAA93E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 18:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412B66E0CB;
	Thu,  5 Sep 2019 16:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C156E0AF;
 Thu,  5 Sep 2019 16:41:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 09:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="190552022"
Received: from rweigelx-mobl1.ger.corp.intel.com (HELO [10.252.40.21])
 ([10.252.40.21])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2019 09:41:14 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <606d87b2-1840-c893-eb30-d6c471c9e50a@linux.intel.com>
Date: Thu, 5 Sep 2019 18:41:13 +0200
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

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKRml4ZXMgZm9yIHY1LjMgZmluYWwhIEhvcGVmdWxseSBsYXN0
IGZvciB2NS4zIG5vdy4gOikKCmRybS1taXNjLWZpeGVzLTIwMTktMDktMDU6CmRybS1taXNjLWZp
eGVzIGZvciB2NS4zIGZpbmFsOgotIE1ha2UgaW5nZW5pYyBwYW5lbCB0eXBlIERQSSBpbnN0ZWFk
IG9mIHVua25vd24uCi0gRml4ZXMgZm9yIGNvbW1hbmQgbGluZSBwYXJzZXIgbW9kZXMuClRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNjk3OGJjZTA1NDI0N2U0Y2ZjY2RmNjg5Y2Uy
NjNlMDc2NDk5ZjkwNToKCiAgZHJtL2tvbWVkYTogUmVvcmRlcmVkIHRoZSBrb21lZGEncyBkZS1p
bml0IGZ1bmN0aW9ucyAoMjAxOS0wOC0yOCAxNzo1NTo0MCArMDEwMCkKCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9kcm0vZHJtLW1pc2MgdGFncy9kcm0tbWlzYy1maXhlcy0yMDE5LTA5LTA1Cgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gNDI0YzM4YTRlMzI1MDlhZTgyZGM5ZDczMDA0MzIyOTU4MDZj
YjkxMToKCiAgZHJtL3NlbGZ0ZXN0czogbW9kZXM6IEFkZCBtb3JlIHVuaXQgdGVzdHMgZm9yIHRo
ZSBjbWRsaW5lIHBhcnNlciAoMjAxOS0wOC0zMCAxMDoyMTo1NiArMDIwMCkKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJt
LW1pc2MtZml4ZXMgZm9yIHY1LjMgZmluYWw6Ci0gTWFrZSBpbmdlbmljIHBhbmVsIHR5cGUgRFBJ
IGluc3RlYWRvIGYgdW5rbm93bi4KLSBGaXhlcyBmb3IgY29tbWFuZCBsaW5lIHBhcnNlciBtb2Rl
cy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KTGF1cmVudCBQaW5jaGFydCAoMSk6CiAgICAgIGRybS9pbmdlbmljOiBIYXJk
Y29kZSBwYW5lbCB0eXBlIHRvIERQSQoKTWF4aW1lIFJpcGFyZCAoNCk6CiAgICAgIGRybS9tb2Rl
czogQWRkIGEgc3dpdGNoIHRvIGRpZmZlcmVudGlhdGUgZnJlZSBzdGFuZGluZyBvcHRpb25zCiAg
ICAgIGRybS9tb2RlczogRml4IHRoZSBjb21tYW5kIGxpbmUgcGFyc2VyIHRvIHRha2UgZm9yY2Ug
b3B0aW9ucyBpbnRvIGFjY291bnQKICAgICAgZHJtL21vZGVzOiBJbnRyb2R1Y2UgYSB3aGl0ZWxp
c3QgZm9yIHRoZSBuYW1lZCBtb2RlcwogICAgICBkcm0vc2VsZnRlc3RzOiBtb2RlczogQWRkIG1v
cmUgdW5pdCB0ZXN0cyBmb3IgdGhlIGNtZGxpbmUgcGFyc2VyCgogZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2Rlcy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNTQgKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jICAgICAgICAgICAgICB8ICAgNSArLQogZHJp
dmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaCAgfCAgIDcgKysK
IC4uLi9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9jbWRsaW5lX3BhcnNlci5jICAgIHwgMTMw
ICsrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxODcgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
