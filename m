Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A81454F
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3074892BC;
	Mon,  6 May 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F64D89256
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 07:33:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6C6E17215A; Mon,  6 May 2019 07:33:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110143] Doom 3: BFG Edition - Steam and GOG.com - white
 flickering screen
Date: Mon, 06 May 2019 07:33:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110143-502-emzXH80R7F@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110143-502@http.bugs.freedesktop.org/>
References: <bug-110143-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0375462820=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0375462820==
Content-Type: multipart/alternative; boundary="15571280151.5FE5bA784.9782"
Content-Transfer-Encoding: 7bit


--15571280151.5FE5bA784.9782
Date: Mon, 6 May 2019 07:33:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110143

Timothy Arceri <t_arceri@yahoo.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from Timothy Arceri <t_arceri@yahoo.com.au> ---
Should be fixed by:

commit 1af72fa4d665b9847dff9b22d7a7dea01c0960c7 (HEAD -> master, origin/mas=
ter,
origin/HEAD)
Author: Timothy Arceri <tarceri@itsqueeze.com>
Date:   Fri May 3 13:59:05 2019 +1000

    util/drirc: add workarounds for bugs in Doom 3: BFG

    This makes the game playable on radeonsi.

    Cc: "19.0" "19.1" <mesa-stable@lists.freedesktop.org>
    Reviewed-by: Samuel Pitoiset <samuel.pitoiset@gmail.com>
    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D110143

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571280151.5FE5bA784.9782
Date: Mon, 6 May 2019 07:33:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:t_arceri&=
#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.com.au&gt;=
"> <span class=3D"fn">Timothy Arceri</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Doom 3: BFG Edition - Steam and GOG.com - whit=
e flickering screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110143">bug 11014=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEEDINFO
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Doom 3: BFG Edition - Steam and GOG.com - whit=
e flickering screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110143#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Doom 3: BFG Edition - Steam and GOG.com - whit=
e flickering screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110143">bug 11014=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>Should be fixed by:

commit 1af72fa4d665b9847dff9b22d7a7dea01c0960c7 (HEAD -&gt; master, origin/=
master,
origin/HEAD)
Author: Timothy Arceri &lt;<a href=3D"mailto:tarceri&#64;itsqueeze.com">tar=
ceri&#64;itsqueeze.com</a>&gt;
Date:   Fri May 3 13:59:05 2019 +1000

    util/drirc: add workarounds for bugs in Doom 3: BFG

    This makes the game playable on radeonsi.

    Cc: &quot;19.0&quot; &quot;19.1&quot; &lt;<a href=3D"mailto:mesa-stable=
&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;
    Reviewed-by: Samuel Pitoiset &lt;<a href=3D"mailto:samuel.pitoiset&#64;=
gmail.com">samuel.pitoiset&#64;gmail.com</a>&gt;
    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Doom 3: BFG Edition - Steam and GOG.com - whit=
e flickering screen"
   href=3D"show_bug.cgi?id=3D110143">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110143</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571280151.5FE5bA784.9782--

--===============0375462820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0375462820==--
