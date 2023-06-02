Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B5471F7B6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 03:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B1110E07E;
	Fri,  2 Jun 2023 01:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC9610E07E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 01:21:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9096564B4F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 01:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02864C433A0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685668896;
 bh=RhjwJg/8rfo5AAtTx+/bHMdp/cuep4FThIKEgzTmGPo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OQaRJATroU6gdT9NouqjXzwYc1u54jaznY8z67aN+TaT/RwgXbxTwUdCokVZ9UTcb
 RvkLeYeeAsDr+seiT00F+LxexOa5oKufVoWjUnsJUsDRwhRfINUI22y7rURLEEPppQ
 mwLFd2ZhyAhxBGWF/s99qGoaK2S8wHWRcdwG7cZ1EYSgvMsJFnBXYhkKDhDNB6vHsm
 S5lsM2vclfeMleHQZ+k4CIC7AStc8gyWsYqp+fc7Xvwhuxs6QUhXuyL99pvrNXOj4X
 Oy7vDFRiM4mn5Sb7E/OlNOETl9Qgdjb4PlPzvvV6g3QYvz1PRDy+BvMbBwclKUQLSR
 GmyH/435T43Yg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E1A1DC43145; Fri,  2 Jun 2023 01:21:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 90091] Computer freeze
Date: Fri, 02 Jun 2023 01:21:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marc.collin@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-90091-2300-nPqEXbNno2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-90091-2300@https.bugzilla.kernel.org/>
References: <bug-90091-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D90091

--- Comment #5 from Marc Collin (marc.collin@protonmail.com) ---
i don't have this computer anymore

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
