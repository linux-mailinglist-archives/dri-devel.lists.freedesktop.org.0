Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E548E5A7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 09:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1185B6E8BE;
	Thu, 15 Aug 2019 07:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F72B6E8BA;
 Thu, 15 Aug 2019 07:42:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 00:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; d="scan'208";a="194717810"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 00:42:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 15 Aug 2019 10:42:19 +0300
Message-ID: <87zhkag9ic.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKT25lIHVzZSBhZnRlciBmcmVlIGZpeCBmb3IgR1ZULgoKSXQg
ZG9lc24ndCBoYXZlIGEgTGluazogdGFnIGJlY2F1c2UgZGltIGRvZXNuJ3QgY2hlY2sgdGhhdCB3
aGlsZQphcHBseWluZyB0aGUgcHVsbCwgYW5kLCBmb3Igc29tZSByZWFzb24sIGl0IHdhcyBhbHNv
IG5vdCBjaGVja2VkIHdoZW4gSQpwdXNoZWQgb3V0IHRoZSBicmFuY2guIFBvc3NpYmx5IGJlY2F1
c2UgaXQncyBpbiBhIG1lcmdlPyBBbnl3YXksIEkgb25seQpnb3QgdGhlIGNvbXBsYWludCB3aGVu
IG1ha2luZyB0aGUgcHVsbCByZXF1ZXN0LCB3aGljaCBpcyB0b28gbGF0ZS4KCmRybS1pbnRlbC1m
aXhlcy0yMDE5LTA4LTE1Ogpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuNC1yYzU6Ci0gR1ZUIHVzZS1h
ZnRlci1mcmVlIGZpeAoKQlIsCkphbmkuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IGQ0NTMzMWIwMGRkYjE3OWUyOTE3NjY2MTcyNTkyNjFjMTEyZGI4NzI6CgogIExpbnV4IDUu
My1yYzQgKDIwMTktMDgtMTEgMTM6MjY6NDEgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBH
aXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2Ry
bS1pbnRlbCB0YWdzL2RybS1pbnRlbC1maXhlcy0yMDE5LTA4LTE1Cgpmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gZGFhMzcyMDBkNDg5MDZkNzFjNjNjZTE3OGJmN2Q0MTBiN2UwNzA4MjoK
CiAgTWVyZ2UgdGFnICdndnQtZml4ZXMtMjAxOS0wOC0xMycgb2YgaHR0cHM6Ly9naXRodWIuY29t
L2ludGVsL2d2dC1saW51eCBpbnRvIGRybS1pbnRlbC1maXhlcyAoMjAxOS0wOC0xMyAxNjoyNjoz
NCArMDMwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KZHJtL2k5MTUgZml4ZXMgZm9yIHY1LjQtcmM1OgotIEdWVCB1c2Ut
YWZ0ZXItZnJlZSBmaXgKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRGFuIENhcnBlbnRlciAoMSk6CiAgICAgIGRybS9pOTE1
OiBVc2UgYWZ0ZXIgZnJlZSBpbiBlcnJvciBwYXRoIGluIGludGVsX3ZncHVfY3JlYXRlX3dvcmts
b2FkKCkKCkphbmkgTmlrdWxhICgxKToKICAgICAgTWVyZ2UgdGFnICdndnQtZml4ZXMtMjAxOS0w
OC0xMycgb2YgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eCBpbnRvIGRybS1pbnRl
bC1maXhlcwoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIApKYW5p
IE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
