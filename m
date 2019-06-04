Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D7340A0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BF089789;
	Tue,  4 Jun 2019 07:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 956778979D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 07:47:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9209E72167; Tue,  4 Jun 2019 07:47:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110276] Memory leak on kernel 5.0 using Vulkan applications,
 fixed on drm-tip and 5.1-rc1
Date: Tue, 04 Jun 2019 07:47:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jani.nikula@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: ckoenig.leichtzumerken@gmail.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-110276-502-obroyliVIs@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110276-502@http.bugs.freedesktop.org/>
References: <bug-110276-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
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
Content-Type: multipart/mixed; boundary="===============1855293053=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1855293053==
Content-Type: multipart/alternative; boundary="15596344793.db698e11E.19292"
Content-Transfer-Encoding: 7bit


--15596344793.db698e11E.19292
Date: Tue, 4 Jun 2019 07:47:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110276

Jani Nikula <jani.nikula@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|dri-devel@lists.freedesktop |ckoenig.leichtzumerken@gmai
                   |.org                        |l.com

--- Comment #4 from Jani Nikula <jani.nikula@intel.com> ---
Fixed upstream and not our bug. Move to DRM/other, assign to Christian to
decide what to do with the potential stable backport.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596344793.db698e11E.19292
Date: Tue, 4 Jun 2019 07:47:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jani.niku=
la&#64;intel.com" title=3D"Jani Nikula &lt;jani.nikula&#64;intel.com&gt;"> =
<span class=3D"fn">Jani Nikula</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Memory leak on kernel 5.0 using Vulkan applications, fixe=
d on drm-tip and 5.1-rc1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110276">bug 11027=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>ckoenig.leichtzumerken&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Memory leak on kernel 5.0 using Vulkan applications, fixe=
d on drm-tip and 5.1-rc1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110276#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Memory leak on kernel 5.0 using Vulkan applications, fixe=
d on drm-tip and 5.1-rc1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110276">bug 11027=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jani.nikula&#64;intel.com" title=3D"Jani Nikula &lt;jani.nikula&#64;intel.c=
om&gt;"> <span class=3D"fn">Jani Nikula</span></a>
</span></b>
        <pre>Fixed upstream and not our bug. Move to DRM/other, assign to C=
hristian to
decide what to do with the potential stable backport.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596344793.db698e11E.19292--

--===============1855293053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1855293053==--
