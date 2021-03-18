Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF435340523
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 13:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9342C6E055;
	Thu, 18 Mar 2021 12:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6066E055;
 Thu, 18 Mar 2021 12:05:42 +0000 (UTC)
IronPort-SDR: VM8HDtaWEZv741JIytioE3+7kN5bf2V/D16juE06W+C/kEmABT3pYWRnL8Kgo79RXylTwh0mfH
 H0g8NYuM0jYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189706226"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="189706226"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 05:05:41 -0700
IronPort-SDR: usyxDt8Z/3bA4fkW7KnoomFRxNlsBFNrPeQzI9HxnUOmxyoHEGj560i+bxKbzxDEJluqCTKUwR
 FWkN+VdVGZAg==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="413055147"
Received: from hschroed-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.35.158])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 05:05:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 18 Mar 2021 14:05:34 +0200
Message-ID: <87blbg8y5t.fsf@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKQ292ZXJpbmcgZm9yIFJvZHJpZ28gZHVyaW5nIGhpcyBhYnNl
bmNlIHRoaXMgd2Vlay4KCmRybS1pbnRlbC1maXhlcy0yMDIxLTAzLTE4Ogpkcm0vaTkxNSBmaXhl
cyBmb3IgdjUuMTItcmM0OgotIFdvcmthcm91bmQgYXN5bmMgZmxpcCArIFZULWQgZnJhbWUgY29y
cnVwdGlvbiBvbiBIU1cvQkRXCi0gRml4IE5NSSB3YXRjaGRvZyBjcmFzaCBkdWUgdG8gdW5pbml0
aWFsaXplZCBPQSBidWZmZXIgdXNlIG9uIGdlbjEyKwoKQlIsCkphbmkuCgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IDFlMjhlZWQxNzY5N2JjZjM0M2M2NzQzZjAwMjhjYzNiNWRk
ODhiZjA6CgogIExpbnV4IDUuMTItcmMzICgyMDIxLTAzLTE0IDE0OjQxOjAyIC0wNzAwKQoKYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy9kcm0taW50ZWwtZml4ZXMtMjAyMS0wMy0x
OAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDZhNzdjNmJiNzI2MGJkNTAwMGY5NWRm
NDU0ZDlmOGNkYjFhZjcxMzI6CgogIGk5MTUvcGVyZjogU3RhcnQgaHJ0aW1lciBvbmx5IGlmIHNh
bXBsaW5nIHRoZSBPQSBidWZmZXIgKDIwMjEtMDMtMTcgMTI6NTE6MzcgKzAyMDApCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CmRybS9pOTE1IGZpeGVzIGZvciB2NS4xMi1yYzQ6Ci0gV29ya2Fyb3VuZCBhc3luYyBmbGlwICsg
VlQtZCBmcmFtZSBjb3JydXB0aW9uIG9uIEhTVy9CRFcKLSBGaXggTk1JIHdhdGNoZG9nIGNyYXNo
IGR1ZSB0byB1bmluaXRpYWxpemVkIE9BIGJ1ZmZlciB1c2Ugb24gZ2VuMTIrCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClVt
ZXNoIE5lcmxpZ2UgUmFtYXBwYSAoMSk6CiAgICAgIGk5MTUvcGVyZjogU3RhcnQgaHJ0aW1lciBv
bmx5IGlmIHNhbXBsaW5nIHRoZSBPQSBidWZmZXIKClZpbGxlIFN5cmrDpGzDpCAoMSk6CiAgICAg
IGRybS9pOTE1OiBXb3JrYXJvdW5kIGFzeW5jIGZsaXAgKyBWVC1kIGNvcnJ1cHRpb24gb24gSFNX
L0JEVwoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGVyZi5jIHwgMTMgKysrKystLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgfCAyMyArKysrKysrKysrKysrKysr
KysrKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYyAgfCAxNiArKysrKysrKysr
KysrKystCiAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
