Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81BF20E6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 22:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF396E2B2;
	Wed,  6 Nov 2019 21:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D2B6E0A2;
 Wed,  6 Nov 2019 21:38:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 13:38:47 -0800
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="205963118"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 13:38:47 -0800
Date: Wed, 6 Nov 2019 13:39:58 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20191106213958.GA16525@intel.com>
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

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKSGVyZSBnb2VzIGRybS1pbnRlbC1maXhlcy0yMDE5LTExLTA2
OgoKLSBGaXggSFBEIHBvbGwgdG8gYXZvaWQga3dvcmtlciBjb25zdW1pbmcgYSBsb3Qgb2YgY3B1
IGN5Y2xlcy4KLSBEbyBub3QgdXNlIFRCVCB0eXBlIGZvciBub24gVHlwZS1DIHBvcnRzLgoKVGhh
bmtzLApSb2RyaWdvLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhOTlkODA4
MGFhZjM1OGQ1ZDIzNTgxMjQ0ZTVkYTIzYjM1ZTM0MGI5OgoKICBMaW51eCA1LjQtcmM2ICgyMDE5
LTExLTAzIDE0OjA3OjI2IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFn
cy9kcm0taW50ZWwtZml4ZXMtMjAxOS0xMS0wNgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIGVlMmM1ZWY4YTlkNjQwZWUxNjE3ZWM5N2I4NGZlMmY2MzQyODRlNTE6CgogIGRybS9pOTE1
L2RwOiBEbyBub3Qgc3dpdGNoIGF1eCB0byBUQlQgbW9kZSBmb3Igbm9uLVRDIHBvcnRzICgyMDE5
LTExLTA0IDEzOjI0OjE0IC0wODAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotIEZpeCBIUEQgcG9sbCB0byBhdm9pZCBr
d29ya2VyIGNvbnN1bWluZyBhIGxvdCBvZiBjcHUgY3ljbGVzLgotIERvIG5vdCB1c2UgVEJUIHR5
cGUgZm9yIG5vbiBUeXBlLUMgcG9ydHMuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkltcmUgRGVhayAoMSk6CiAgICAgIGRy
bS9pOTE1OiBBdm9pZCBIUEQgcG9sbCBkZXRlY3QgdHJpZ2dlcmluZyBhIG5ldyBkZXRlY3QgY3lj
bGUKCkpvc8OpIFJvYmVydG8gZGUgU291emEgKDEpOgogICAgICBkcm0vaTkxNS9kcDogRG8gbm90
IHN3aXRjaCBhdXggdG8gVEJUIG1vZGUgZm9yIG5vbi1UQyBwb3J0cwoKIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0LmMgIHwgIDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgfCAxMiArKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgIDYgKysrKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
