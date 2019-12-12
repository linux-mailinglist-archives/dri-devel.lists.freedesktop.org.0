Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019D11D623
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 19:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF316E0D5;
	Thu, 12 Dec 2019 18:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66F16E0D5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 18:47:06 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id x123so2335337vsc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 10:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NLieNUr/t5H4m13PsHXZwBVRvov7AYKD8z3NBltfvMo=;
 b=S1iJ2rRIOXo2gVWQFtMrKEP6V/5ektRMYtlvGxBuI2AywOUCszEIguzJHhvy/9L304
 TlP/swx1MEBgcrHKe3gjUTOwKdBFyrcNIzGQOL7bfuRi5Ltoho9vdmY1jE/ENgvO974W
 rH7ATjWupGL0sQg+ddLNdbZZO7dQlRSbpwMNNTks2GWox8Hmm5tViLVSkDrZ7Qzc14OK
 M/90kh9F3FR25k1fAMccR+/YEBKXKEdKcvscUv8rD9M3e2srrKPqM2XObG0zH+DTCAi5
 UxzY0U3pSl1W1NnAJCrJ1yvSX8Co8N5+R+z8+dNhYjkcIIspziFz8lDgoWvveHz1Aq6W
 1WNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NLieNUr/t5H4m13PsHXZwBVRvov7AYKD8z3NBltfvMo=;
 b=tyUFwNRhlTx1pcC3MKXdsPrz6h010t3rhBkewvNFOGChfhbrQ5o34WjOCwIseVmfZW
 c4q2NSzQPdUSxfhd5UvkgVs2LLJzQPl4OvwYm9gJc8e+AHOrOVWm4q0HJFAIS8pKJAG6
 xLP8R96vRCGMRXX2okVCM8anycRydfdVs3ttONlSphlXcZhjpyy8ylXxeQ5/la6fJm03
 yZtCXZvVk3JZpDJ9ZpJDQTWxuFajZF26wR5icvrTAojKH8uzpIUeLkHHPOODXg78jTqL
 Wl780F4UBj2GCPOfYboU4LQIOHxOwsU2HmQ9Wu81b3W5KRjW6/QTCeMqFBaDEZIAVlgt
 HCXw==
X-Gm-Message-State: APjAAAWh+MSgrjK5o7mlw9T0yv2f3VZrc/J5u/ryRBSGqA2toDEwbcsg
 M3ODUwuF902+CnvwgwkgvhcobVqy4z6PXA9S1v3WbzfB
X-Google-Smtp-Source: APXvYqwAwPywrGIBKWChUkgIjchBKHOd1JpejQwhdUCZ3Fs47KQybTWF4sEu8uBva2BTtOSC6oELGWCnf8tf4aaCxRc=
X-Received: by 2002:a67:e00d:: with SMTP id c13mr8290562vsl.57.1576176425172; 
 Thu, 12 Dec 2019 10:47:05 -0800 (PST)
MIME-Version: 1.0
From: Sumit Kumar <sumitkumar27022001@gmail.com>
Date: Fri, 13 Dec 2019 00:16:59 +0530
Message-ID: <CAHb2E9owxy40KzcTecwKbO-8NXQtZcabuyp+CokEbRb_x04weA@mail.gmail.com>
Subject: contribution to x.org
To: dri-devel@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============0023338544=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0023338544==
Content-Type: multipart/alternative; boundary="000000000000ed040a0599862b58"

--000000000000ed040a0599862b58
Content-Type: text/plain; charset="UTF-8"

I am new to the open source community. Can anyone help me get started?
Assigning a task would also help.

--000000000000ed040a0599862b58
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">I am new to the open source community. Can anyone help me get started? Assigning a task would also help.</div>

--000000000000ed040a0599862b58--

--===============0023338544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0023338544==--
