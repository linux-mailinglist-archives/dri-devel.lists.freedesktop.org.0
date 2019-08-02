Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AED7F88B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD766EE39;
	Fri,  2 Aug 2019 13:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A5C5E6EE3E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:21:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A2A5D72167; Fri,  2 Aug 2019 13:21:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111244] amdgpu kernel 5.2 blank display after resume from suspend
Date: Fri, 02 Aug 2019 13:21:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samuele.decarli@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111244-502-b5bJ6NmPYe@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111244-502@http.bugs.freedesktop.org/>
References: <bug-111244-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2130455828=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2130455828==
Content-Type: multipart/alternative; boundary="15647521053.AAefA922.21475"
Content-Transfer-Encoding: 7bit


--15647521053.AAefA922.21475
Date: Fri, 2 Aug 2019 13:21:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111244

--- Comment #9 from Samuele Decarli <samuele.decarli@gmail.com> ---
Created attachment 144929
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144929&action=3Dedit
Kernel log displaying issue

Compressed here is my kernel log, which shows repeating stack traces

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15647521053.AAefA922.21475
Date: Fri, 2 Aug 2019 13:21:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - amdgpu kernel 5.2 blank display after resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - amdgpu kernel 5.2 blank display after resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244">bug 11124=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samuele.decarli&#64;gmail.com" title=3D"Samuele Decarli &lt;samuele.decarli=
&#64;gmail.com&gt;"> <span class=3D"fn">Samuele Decarli</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144929=
" name=3D"attach_144929" title=3D"Kernel log displaying issue">attachment 1=
44929</a> <a href=3D"attachment.cgi?id=3D144929&amp;action=3Dedit" title=3D=
"Kernel log displaying issue">[details]</a></span>
Kernel log displaying issue

Compressed here is my kernel log, which shows repeating stack traces</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15647521053.AAefA922.21475--

--===============2130455828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2130455828==--
