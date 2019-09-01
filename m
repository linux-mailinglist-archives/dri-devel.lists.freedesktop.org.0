Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A539A4817
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 09:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A016E19C;
	Sun,  1 Sep 2019 07:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7626E19C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 07:20:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sun, 01 Sep 2019 07:20:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204725-2300-MHEacHc4Xs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204725-2300@https.bugzilla.kernel.org/>
References: <bug-204725-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ3MjUKCi0tLSBD
b21tZW50ICMyOSBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCkNy
ZWF0ZWQgYXR0YWNobWVudCAyODQ3NDMKICAtLT4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L2F0dGFjaG1lbnQuY2dpP2lkPTI4NDc0MyZhY3Rpb249ZWRpdAp4b3JnIGxvZyAyCgppbnRlcmVz
dGluZy4KCgp0aG9zZSBsaW5lczoKNDQwLjYyOF0gKEVFKSBGYWlsZWQgdG8gbG9hZCBtb2R1bGUg
ImF0aSIgKG1vZHVsZSBkb2VzIG5vdCBleGlzdCwgMCkKNDQwLjYyOV0gKEVFKSBGYWlsZWQgdG8g
bG9hZCBtb2R1bGUgImZiZGV2IiAobW9kdWxlIGRvZXMgbm90IGV4aXN0LCAwKQoKdGhlbiBhbWRn
cHUga2lja3MgaW4uCmFuZCBub3RoaW5nIGhhcHBlbnMuCmJsYWNrIHNjcmVlbiBhcyB1c3VhbC4K
a2V5Ym9hcmQgaXMgZGVhZC4KCmJ0dywgSSBzaW5jZSBJIGRpc2FibGVkIGxlZ2FjeSBGQiwgSSBj
b3VsZCBzdGlsbCBzZWUgbWVzc2FnZXMgb2Yga2VybmVsIHVudGlsCmFtZGdwdSBsb2FkZWQgaW4u
CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hp
bmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
