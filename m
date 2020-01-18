Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1744D1419B8
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 21:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996F86E141;
	Sat, 18 Jan 2020 20:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64876E141
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 20:59:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206231] R9 280X low performance with all games
Date: Sat, 18 Jan 2020 20:59:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kentosama@whiteninjastudio.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206231-2300-68jgyvsfvW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206231-2300@https.bugzilla.kernel.org/>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=206231

--- Comment #17 from Jacques Belosoukinski (kentosama@whiteninjastudio.com) ---
(In reply to Sylvain BERTRAND from comment #16)
> On Sat, Jan 18, 2020 at 03:00:49PM +0000,
> bugzilla-daemon@bugzilla.kernel.org wrote:
> > https://ibb.co/GCmHFkf
> > https://ibb.co/ZXsvNZL
> 
> Still the unreadable screenshots. huh??
> 
> > I use Gallium HUD with this options :
> 
> Gallium HUD does not work with vulkan (as far as I know), hence for dota2
> vulkan.
> In dota2 you have an option to display the 3d engine(valve source2) fps.
> 
> In cs:go, there is a way to enable the 3d engine(valve source1) fps display.
> It is via the "console", see google.com.
> 
> > My is CPU is an AMD FX 8320
> 
> I have a FX9590, then our benchmarks should be mostly the same.

I downloaded the Vulkan DLC and active the FPS in Dota 2. I get between ~80 and
90 fps :

https://cdn.discordapp.com/attachments/410134758891323400/668192505740787762/20200118213508_1.jpg

https://cdn.discordapp.com/attachments/410134758891323400/668192505740787762/20200118213508_1.jpg

For CSGO, i get between ~70 and +100fps :

https://cdn.discordapp.com/attachments/410134758891323400/668197367094181899/20200118215441_1.jpg

https://cdn.discordapp.com/attachments/410134758891323400/668197384995733504/20200118215612_1.jpg

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
