Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EEC4FDD7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 21:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEF5899B0;
	Sun, 23 Jun 2019 19:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E00A88EAA
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 19:21:28 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 0E9B128AB9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 19:21:28 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 031A028ABC; Sun, 23 Jun 2019 19:21:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203963] New: Unable to overclock memory while core is
 overclocking fine. RX560X
Date: Sun, 23 Jun 2019 19:21:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-203963-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM5NjMKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjAzOTYzCiAgICAgICAgICAgU3VtbWFyeTogVW5hYmxlIHRvIG92ZXJj
bG9jayBtZW1vcnkgd2hpbGUgY29yZSBpcyBvdmVyY2xvY2tpbmcKICAgICAgICAgICAgICAgICAg
ICBmaW5lLiBSWDU2MFgKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAgVmVy
c2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4yLXJjNgogICAgICAgICAgSGFyZHdhcmU6
IEFsbAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJlZTogTWFpbmxp
bmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBub3JtYWwKICAg
ICAgICAgIFByaW9yaXR5OiBQMQogICAgICAgICBDb21wb25lbnQ6IFZpZGVvKERSSSAtIG5vbiBJ
bnRlbCkKICAgICAgICAgIEFzc2lnbmVlOiBkcml2ZXJzX3ZpZGVvLWRyaUBrZXJuZWwtYnVncy5v
c2RsLm9yZwogICAgICAgICAgUmVwb3J0ZXI6IGhheGs2MTJAZ21haWwuY29tCiAgICAgICAgUmVn
cmVzc2lvbjogTm8KCkFzIHRoZSB0aXRsZSBzYXlzIGltIHVuYWJsZSB0byBvdmVyY2xvY2sgdGhl
IG1lbW9yeSBvZiBteSBkR1BVIHdoaWNoIG1ha2VzIHRoZQplbnRpcmUgcG9pbnQgb2Ygb3ZlcmNs
b2NraW5nIHVzZWxlc3MgYmFzaWNhbGx5LgpJbSB1c2luZyByYWRlb24tcHJvZmlsZSB0byBtb25p
dG9yIG15IEdQVSBhbmQgb3ZlcmNsb2NrIGl0LgpJIHdpbGwgaG9wZWZ1bGx5IHBvc3QgZG1lc2cg
dG9tb3Jyb3cuIElmIHlvdSBuZWVkIGFueXRoaW5nIGVsc2UgaW0gaGFwcHkgdG8KaGVscC4KCi0t
IApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0
aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
