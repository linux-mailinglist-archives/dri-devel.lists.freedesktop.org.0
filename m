Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2653332B71
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 17:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C94B6E0F4;
	Tue,  9 Mar 2021 16:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301396E0F4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 16:06:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D36B765242
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615306003;
 bh=XV5AgegRzGMgCzS25Mf7ZPkOavn7LwRjATYLGDw+cJU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kK2E25u0TMBmdsGs/kVVpVyrxx9Nv5vGlTg9vpyKXbDSRkxQrQ1SMahXIdZTYB1aw
 o9UJkxMqGY/UJckKidH6QCR11v4bdU33e0ydB3DRCDm2HUBkMcnttOG0pAqMvmGBAN
 JPhwDlnSikqEtlDLUEyaw15LyOFV5oaliJGNg8btjYZJcoR6W2vi0tzvQesX6r06/g
 wBPhXJZnDpNMcLRCRiqYFmW9Hk8UliPywNofcFACi2o1RQBmz1Ny8BokzYQXyW+oF/
 euxZwYZusgTy9hkL5cN9BR0mumqsoYvcmbg6LPfXBPdWzFSDwDVXC9mAxwce/1fAJ0
 AgaooO/aTfbyw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C389065349; Tue,  9 Mar 2021 16:06:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Tue, 09 Mar 2021 16:06:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212107-2300-nh2MBMTolW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIxMDcKCi0tLSBD
b21tZW50ICM2IGZyb20gRGlldGVyIE7DvHR6ZWwgKERpZXRlckBudWV0emVsLWhoLmRlKSAtLS0K
KEluIHJlcGx5IHRvIE1hcnRpbiBmcm9tIGNvbW1lbnQgIzUpCj4gKEluIHJlcGx5IHRvIEFsZXgg
RGV1Y2hlciBmcm9tIGNvbW1lbnQgIzQpCj4gPiBUaGUgZHJpdmVyIHR1cm5zIG9mZiB0aGUgZmFu
cyBmb3IgYWNvdXN0aWMgcmVhc29ucyBpZiB0aGUgT0VNIGVuYWJsZWQKPiA+IHN1cHBvcnQgZm9y
IHRoZSBmZWF0dXJlIGluIHRoZSB2Ymlvcy4gIFRoZXkgd2lsbCBzdGlsbCBnbyBvbiB3aGVuIHRo
ZQo+ID4gdGVtcGVyYXR1cmUgZ2V0cyBoaWdoIGVub3VnaC4KPiAKPiBPay4gSSBjaGVja2VkIGFn
YWluIGFuZCB0aGUgZmFuIGRvZXMgdHVybiBvbiB3aGVuIHBsYXlpbmcgYSBnYW1lIChnemRvb20p
Lgo+IAo+IFRvbyBiYWQgaXQncyB0aGUgcXVpZXRlc3QgZmFuIGluIG15IFBDIDopCj4gCj4gSSBn
dWVzcyBJIHBhbmlja2VkLgo+IAo+IElmIHRoaXMgaXMgdGhlIGV4cGVjdGVkIGJlaGF2aW91ciB0
aGVuIHRoaXMgYnVnIGNhbiBiZSBjbG9zZWQuCj4gCj4gVGhhbmsgeW91LgoKSXQgX2lzXyBleHBl
Y3RlZCBhbmQgd2Ugd2FpdGVkICh2ZXJ5KSBsb25nIGZvciBpdC4gOy0pCihEaWQgcmVndWxhcmx5
IHRlc3Rpbmcgd2l0aCBhbWQtc3RhZ2luZy1kcm0tbmV4dCBrZXJuZWwuKQoKWW91IGNhbiBjbG9z
ZSBpdC4KKEZpcnN0ICdzb2x2ZWQnLCBsYXRlciAnY2xvc2VkJykuCgpHcmVldGluZ3MKRGlldGVy
CgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3Ug
YXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNz
aWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
