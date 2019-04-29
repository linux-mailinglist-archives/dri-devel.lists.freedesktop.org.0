Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76BDD45
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE1E8926B;
	Mon, 29 Apr 2019 07:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C9D08926B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:58:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5924972155; Mon, 29 Apr 2019 07:58:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110514] [CI][BAT] igt@* - skip - Test requirement:
 is_i915_device(fd) && has_known_intel_chipset(fd), Skip
Date: Mon, 29 Apr 2019 07:58:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110514-502-8XNUXJX7l3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110514-502@http.bugs.freedesktop.org/>
References: <bug-110514-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1989558184=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1989558184==
Content-Type: multipart/alternative; boundary="15565246852.c814B7.8467"
Content-Transfer-Encoding: 7bit


--15565246852.c814B7.8467
Date: Mon, 29 Apr 2019 07:58:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110514

--- Comment #20 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- CML: igt@gem_render_copy_redux@interruptible - skip - no render-copy
function -}
{+ CML: igt@gem_render_copy_redux@.* - skip - no render-copy function +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@gem_render=
_copy_redux@normal.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@gem_render=
_copy_redux@flink.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt@gem_render=
_copy_redux@flink-interruptible.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565246852.c814B7.8467
Date: Mon, 29 Apr 2019 07:58:05 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][BAT] igt&#64;* - skip - Test requirement:=
 is_i915_device(fd) &amp;&amp; has_known_intel_chipset(fd), Skip"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110514#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][BAT] igt&#64;* - skip - Test requirement:=
 is_i915_device(fd) &amp;&amp; has_known_intel_chipset(fd), Skip"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110514">bug 11051=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>A CI Bug Log filter associated to this bug has been updated:

{- CML: igt&#64;gem_render_copy_redux&#64;interruptible - skip - no render-=
copy
function -}
{+ CML: igt&#64;gem_render_copy_redux&#64;.* - skip - no render-copy functi=
on +}

New failures caught by the filter:

  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;gem_render_copy_redux&#64;normal.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/drmtip_266/fi-cml-u/igt&#64;gem_render_copy_redux&#64;normal.html=
</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;gem_render_copy_redux&#64;flink.html">https://intel-gfx-ci.01.org/tree=
/drm-tip/drmtip_266/fi-cml-u/igt&#64;gem_render_copy_redux&#64;flink.html</=
a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt=
&#64;gem_render_copy_redux&#64;flink-interruptible.html">https://intel-gfx-=
ci.01.org/tree/drm-tip/drmtip_266/fi-cml-u/igt&#64;gem_render_copy_redux&#6=
4;flink-interruptible.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565246852.c814B7.8467--

--===============1989558184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1989558184==--
