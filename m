Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A91BCADAD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 19:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BAD6EA38;
	Thu,  3 Oct 2019 17:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6906EA34;
 Thu,  3 Oct 2019 17:58:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 10:58:22 -0700
X-IronPort-AV: E=Sophos;i="5.67,253,1566889200"; d="scan'208";a="185990380"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 10:58:22 -0700
Date: Thu, 3 Oct 2019 10:58:52 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20191003175852.GA20662@intel.com>
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
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKSSBrbm93IHlvdSBhcmUgb24gWERDIGFuZCBJIHdhcyBldmVu
IGNvbnNpZGVyaW5nIG5vdCBzZW5kIGFueSB0aGlzIHdlZWssCmJ1dCBsZXQgbWUgc2VuZCB0aGlz
IGJlZm9yZSBJIGZvcmdldC4KClRoZXJlIGFyZSB0aGUgZHJtLWludGVsLW5leHQtZml4ZXMgcHVs
bCByZXF1ZXN0cyB0aGF0IEkgaGFkIHNlbnQKdGhhdCBhcmUgc3RpbGwgbmVlZGVkIGFuZCBpdCB3
b3VsZCBiZSBnb29kIGlmIHlvdSBjb3VsZCBwdWxsIHRob3NlLgoKQmVzaWRlcyB3ZSBoYXZlIG1v
cmUgMiBmaXhlcyBoZXJlLgoKSWYgbmVjZXNzYXJ5IGFuZCBlYXNpZXIgSSBjYW4gc2VuZCBhbGwg
Zml4ZXMgdG9nZXRoZXIgbmV4dCB3ZWVrLCBpbmNsdWRpbmcKdGhlIG9uZXMgbWlzc2VkIG9uIC1y
YzEgYW5kIHRoZXNlIG9uZXMgaGVyZSBwbHVzIGFueSB1cGNvbWluZy4KCkp1c3QgbGV0IG1lIGtu
b3cgaG93IHlvdSBwcmVmZXIuCgpIZXJlIGdvZXMgZHJtLWludGVsLWZpeGVzLTIwMTktMTAtMDM6
CgotIEZpeCBkc2MgZHBwIGNhbGN1bGF0aW9ucwotIEZpeCBnNHggc3ByaXRlIHNjYWxpbmcgc3Ry
aWRlIGNoZWNrIHdpdGggR1RUIHJlbWFwcGluZwoKVGhhbmtzLApSb2RyaWdvLgoKVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NGVjYjhmNzAyOGM1ZWIzZDc0MGJiODJiMGYxZDkw
ZjJkZjYzYzVjOgoKICBMaW51eCA1LjQtcmMxICgyMDE5LTA5LTMwIDEwOjM1OjQwIC0wNzAwKQoK
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQu
ZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy9kcm0taW50ZWwtZml4ZXMtMjAxOS0x
MC0wMwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGViMDE5MmZlZDAxNmRiMWM1YTk3
MDFjZDZjYTQ3MjMzZmY0YTQzZTU6CgogIGRybS9pOTE1OiBGaXggZzR4IHNwcml0ZSBzY2FsaW5n
IHN0cmlkZSBjaGVjayB3aXRoIEdUVCByZW1hcHBpbmcgKDIwMTktMTAtMDIgMjI6MjA6MzMgLTA3
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCi0gRml4IGRzYyBkcHAgY2FsY3VsYXRpb25zCi0gRml4IGc0eCBzcHJpdGUg
c2NhbGluZyBzdHJpZGUgY2hlY2sgd2l0aCBHVFQgcmVtYXBwaW5nCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1hYXJ0ZW4g
TGFua2hvcnN0ICgxKToKICAgICAgZHJtL2k5MTUvZHA6IEZpeCBkc2MgYnBwIGNhbGN1bGF0aW9u
cywgdjUuCgpWaWxsZSBTeXJqw6Rsw6QgKDEpOgogICAgICBkcm0vaTkxNTogRml4IGc0eCBzcHJp
dGUgc2NhbGluZyBzdHJpZGUgY2hlY2sgd2l0aCBHVFQgcmVtYXBwaW5nCgogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICB8IDE4NCArKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuaCAgICAgIHwgICA2
ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICB8ICAgMiAr
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYyAgfCAgIDUgKy0K
IDYgZmlsZXMgY2hhbmdlZCwgMTEwIGluc2VydGlvbnMoKyksIDEwMSBkZWxldGlvbnMoLSkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
