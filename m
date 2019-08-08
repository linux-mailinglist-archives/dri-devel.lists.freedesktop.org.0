Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17B85BF8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D1B6E7D7;
	Thu,  8 Aug 2019 07:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBE36E7B2;
 Thu,  8 Aug 2019 07:47:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 00:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="193101382"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2019 00:47:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 08 Aug 2019 10:51:38 +0300
Message-ID: <87pnlghz79.fsf@intel.com>
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

CkhpIERhdmUgJiBEYW5pZWwgLQoKZHJtLWludGVsLWZpeGVzLTIwMTktMDgtMDg6CmRybS9pOTE1
IGZpeGVzIGZvciB2NS4zLXJjNDoKLSBGaXggR0xLIERTSSBlc2NhcGUgY2xvY2sgc2V0dGluZwot
IEZpeCBhIG1lbWxlYWsgb24gSERDUCByZXZva2VkIEtzdiBlcnJvciBwYXRoCgpCUiwKSmFuaS4K
ClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTIxYTcxMmE5Njg1NDg4ZjVjZTgw
NDk1YjM3YjlmZGJlOTZjMjMwZDoKCiAgTGludXggNS4zLXJjMyAoMjAxOS0wOC0wNCAxODo0MDox
MiAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLWludGVsIHRhZ3MvZHJtLWludGVsLWZp
eGVzLTIwMTktMDgtMDgKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA3M2EwZmYwYjMw
YWY3OWJmMDMwM2Q1NTdlYjgyZjFkMTk0NWJiNmVlOgoKICBkcm0vaTkxNTogRml4IHdyb25nIGVz
Y2FwZSBjbG9jayBkaXZpc29yIGluaXQgZm9yIEdMSyAoMjAxOS0wOC0wNSAxMTo0NDowMiArMDMw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KZHJtL2k5MTUgZml4ZXMgZm9yIHY1LjMtcmM0OgotIEZpeCBHTEsgRFNJIGVz
Y2FwZSBjbG9jayBzZXR0aW5nCi0gRml4IGEgbWVtbGVhayBvbiBIRENQIHJldm9rZWQgS3N2IGVy
cm9yIHBhdGgKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KU3RhbmlzbGF2IExpc292c2tpeSAoMSk6CiAgICAgIGRybS9pOTE1
OiBGaXggd3JvbmcgZXNjYXBlIGNsb2NrIGRpdmlzb3IgaW5pdCBmb3IgR0xLCgpXZWkgWW9uZ2p1
biAoMSk6CiAgICAgIGRybS9pOTE1OiBmaXggcG9zc2libGUgbWVtb3J5IGxlYWsgaW4gaW50ZWxf
aGRjcF9hdXRoX2Rvd25zdHJlYW0oKQoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGRjcC5jICB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Zsdl9kc2lf
cGxsLmMgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
