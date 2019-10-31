Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358BEB5DA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 18:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926F6F3BD;
	Thu, 31 Oct 2019 17:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559476F3B8;
 Thu, 31 Oct 2019 17:10:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 10:10:58 -0700
X-IronPort-AV: E=Sophos;i="5.68,252,1569308400"; d="scan'208";a="212521974"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 10:10:57 -0700
Date: Thu, 31 Oct 2019 10:12:09 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20191031171209.GA6586@intel.com>
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

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKSGVyZSBnb2VzIGRybS1pbnRlbC1maXhlcy0yMDE5LTEwLTMx
OgoKLSBGaXggUENIIHJlZmVyZW5jZSBjbG9jayBmb3IgRkRJIG9uIEhTVy9CRFcgd2hpY2ggd2Fz
IGNhdXNpbmcgdXNlcnMgYmxhbmsgc2NyZWVuCi0gU21hbGwgZG9jdW1lbnRhdGlvbiBmaXggZm9y
IFRHTCBkaXNwbGF5IFBMTHMKClRoYW5rcywKUm9kcmlnby4KClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgZDZkNWRmMWRiNmU5ZDdmOGY3NmQyOTExNzA3ZjdkNTg3NzI1MWIwMjoK
CiAgTGludXggNS40LXJjNSAoMjAxOS0xMC0yNyAxMzoxOToxOSAtMDQwMCkKCmFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9w
Lm9yZy9kcm0vZHJtLWludGVsIHRhZ3MvZHJtLWludGVsLWZpeGVzLTIwMTktMTAtMzEKCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA1OWNkODI2ZmI1ZTc4ODk1MTViZjU3NzFlMjk1ZTA2
MjRjMzQ4NTcxOgoKICBkcm0vaTkxNTogRml4IFBDSCByZWZlcmVuY2UgY2xvY2sgZm9yIEZESSBv
biBIU1cvQkRXICgyMDE5LTEwLTI5IDIxOjUwOjI0IC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotIEZpeCBQQ0gg
cmVmZXJlbmNlIGNsb2NrIGZvciBGREkgb24gSFNXL0JEVyB3aGljaCB3YXMgY2F1c2luZyB1c2Vy
cyBibGFuayBzY3JlZW4KLSBTbWFsbCBkb2N1bWVudGF0aW9uIGZpeCBmb3IgVEdMIGRpc3BsYXkg
UExMcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpBbm5hIEthcmFzICgxKToKICAgICAgZHJtL2k5MTUvdGdsOiBGaXggZG9j
IG5vdCBjb3JyZXNwb25kaW5nIHRvIGNvZGUKClZpbGxlIFN5cmrDpGzDpCAoMSk6CiAgICAgIGRy
bS9pOTE1OiBGaXggUENIIHJlZmVyZW5jZSBjbG9jayBmb3IgRkRJIG9uIEhTVy9CRFcKCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyAgfCAxMSArKysrKystLS0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcGxsX21nci5jIHwgMTUgKysr
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwbGxfbWdy
LmggfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oICAgICAgICAgICAg
ICAgfCAgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
